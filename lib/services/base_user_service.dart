import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UserService {
  CollectionReference ref = FirebaseFirestore.instance.collection('usuarios');
  final user = FirebaseAuth.instance;

  Future<void> addUser(String nombre, String edad, String uid, String test1Res,
      String test2Res, String test3Res) async {
    ref
        .add({
          'name': nombre,
          'age': edad,
          'userUid': uid,
          'test1Res': test1Res,
          'test2Res': test2Res,
          'test3Res': test3Res
        })
        .then((value) => print("User added"))
        .catchError((error) => print("Error al agregar usuario: $error"));
  }

  Future<String> getName() async {
    QuerySnapshot quizData = await ref.get();
    String name = "";
    for (var i = 0; i < quizData.docs.length; i++) {
      DocumentSnapshot questionSnapshot = quizData.docs[i];
      String userUid = questionSnapshot.get('userUid');
      if (userUid == user.currentUser!.uid) {
        name = questionSnapshot.get('name');
      }
    }
    return name;
  }

  Future<String> getAge() async {
    QuerySnapshot quizData = await ref.get();
    String age = "";
    for (var i = 0; i < quizData.docs.length; i++) {
      DocumentSnapshot questionSnapshot = quizData.docs[i];
      String userUid = questionSnapshot.get('userUid');
      if (userUid == user.currentUser!.uid) {
        age = questionSnapshot.get('age');
      }
    }
    return age;
  }

  Future<String> getTest1() async {
    QuerySnapshot quizData = await ref.get();
    String test1 = "";
    for (var i = 0; i < quizData.docs.length; i++) {
      DocumentSnapshot questionSnapshot = quizData.docs[i];
      String userUid = questionSnapshot.get('userUid');
      if (userUid == user.currentUser!.uid) {
        test1 = questionSnapshot.get('test1Res');
      }
    }
    return test1;
  }

  Future<String> getTest2() async {
    QuerySnapshot quizData = await ref.get();
    String test2 = "";
    for (var i = 0; i < quizData.docs.length; i++) {
      DocumentSnapshot questionSnapshot = quizData.docs[i];
      String userUid = questionSnapshot.get('userUid');
      if (userUid == user.currentUser!.uid) {
        test2 = questionSnapshot.get('test2Res');
      }
    }
    return test2;
  }

  Future<String> getTest3() async {
    QuerySnapshot quizData = await ref.get();
    String test3 = "";
    for (var i = 0; i < quizData.docs.length; i++) {
      DocumentSnapshot questionSnapshot = quizData.docs[i];
      String userUid = questionSnapshot.get('userUid');
      if (userUid == user.currentUser!.uid) {
        test3 = questionSnapshot.get('test3Res');
      }
    }
    return test3;
  }

  getQuizData(String quizId) async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection("tests")
        .doc(quizId)
        .collection("testContent");
    QuerySnapshot quizData =
        await ref.orderBy('noQuestion', descending: false).get();

    return quizData;
  }
}
