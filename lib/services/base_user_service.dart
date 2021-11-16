import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UserService {
  CollectionReference ref = FirebaseFirestore.instance.collection('usuarios');
  final user = FirebaseAuth.instance;

  Future<String> getName() async {
    QuerySnapshot users = await ref.get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        if(identical(doc.get('userUid').toString(), user.currentUser!.uid.toString())){
          print(doc.get('name').toString()+"\n\n");
          return doc.get('name').toString();
        }
      }
    }

    return "";
  }

  Future<String> getAge() async {
    QuerySnapshot users = await ref.get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        if(identical(doc.get('userUid').toString(), user.currentUser!.uid.toString())){
          return doc.get('age').toString();
        }
      }
    }

    return "";
  }

  Future<void> addUser(String nombre, String edad, String uid) async {
    ref
        .add({'name': nombre, 'age': edad, 'userUid': uid})
        .then((value) => print("User added"))
        .catchError((error) => print("Error al agregar usuario: $error"));
  }


}
