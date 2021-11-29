import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceTwo {
  final user = FirebaseAuth.instance;

  Future<void> addUser(String nombre, String edad, String uid, String test1Res,
      String test2Res, String test3Res) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('users').doc(uid);

    Map<String, dynamic> data = <String, dynamic>{
      'name': nombre,
      'age': edad,
      'test1Res': test1Res,
      'test2Res': test2Res,
      'test3Res': test3Res
    };

    await documentReferencer
        .set(data)
        .then((value) => print("User added"))
        .catchError((error) => print("Error al agregar usuario: $error"));
  }

  Future<String> getName() async {
    DocumentReference documentReferencer = FirebaseFirestore.instance
        .collection('users')
        .doc(user.currentUser!.uid);
    DocumentSnapshot document = await documentReferencer.get();
    String name = document.get('name');
    return name;
  }

  Future<String> getAge() async {
    DocumentReference documentReferencer = FirebaseFirestore.instance
        .collection('users')
        .doc(user.currentUser!.uid);
    DocumentSnapshot document = await documentReferencer.get();
    String age = document.get('age');
    return age;
  }

  Future<String> getTest1() async {
    DocumentReference documentReferencer = FirebaseFirestore.instance
        .collection('users')
        .doc(user.currentUser!.uid);
    DocumentSnapshot document = await documentReferencer.get();

    String test1 = document.get('test1Res');
    return test1;
  }

  Future<String> getTest2() async {
    DocumentReference documentReferencer = FirebaseFirestore.instance
        .collection('users')
        .doc(user.currentUser!.uid);
    DocumentSnapshot document = await documentReferencer.get();

    String test2 = document.get('test2Res');
    return test2;
  }

  Future<String> getTest3() async {
    DocumentReference documentReferencer = FirebaseFirestore.instance
        .collection('users')
        .doc(user.currentUser!.uid);
    DocumentSnapshot document = await documentReferencer.get();

    String test3 = document.get('test3Res');
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
