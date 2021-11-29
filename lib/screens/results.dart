import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Results extends StatefulWidget {
  final int score;
  final int noQuiz;
  Results({required this.score, required this.noQuiz});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  final user = FirebaseAuth.instance;

  void updateData(int noQuiz, String result) async {
    String campo = 'test' + '$noQuiz' + 'Res';

    DocumentReference documentReferencer = FirebaseFirestore.instance
        .collection('users')
        .doc(user.currentUser!.uid);

    await documentReferencer
        .update({campo: result})
        .then((value) => print("User updated"))
        .catchError(
            (error) => print("Error al actualizar datos del usuario: $error"));
  }

  String getDiagnosticByType(int noQuiz, int score) {
    String diagnostic = "";

    switch (noQuiz) {
      case 1:
        diagnostic = getDiagnosticQuiz1And2(score);
        break;
      case 2:
        diagnostic = getDiagnosticQuiz1And2(score);
        break;
      case 3:
        diagnostic = getDiagnosticQuiz3(score);
        break;
    }
    return diagnostic;
  }

  String getDiagnosticQuiz1And2(int score) {
    String diagnosticQuiz1 = "";

    if (score <= 21) {
      diagnosticQuiz1 = "Ansiedad muy baja";
    } else {
      if (score > 21 && score <= 36) {
        //Se agregó el puntaje 36 en esta categoria
        diagnosticQuiz1 = "Ansiedad moderada";
      } else {
        if (score > 36) {
          diagnosticQuiz1 = "Ansiedad severa";
        }
      }
    }
    return diagnosticQuiz1;
  }

  String getDiagnosticQuiz3(int score) {
    String diagnosticQuiz3 = "";

    if (score < 47) {
      diagnosticQuiz3 = "No se encuentra en sobrecarga";
    } else {
      if (score >= 47 && score <= 55) {
        diagnosticQuiz3 = "Sobrecarga leve";
      } else {
        if (score > 55) {
          diagnosticQuiz3 = "Sobrecarga intensa";
        }
      }
    }
    return diagnosticQuiz3;
  }

  @override
  Widget build(BuildContext context) {
    updateData(widget.noQuiz, getDiagnosticByType(widget.noQuiz, widget.score));

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Resultado",
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                getDiagnosticByType(widget.noQuiz, widget.score),
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Inicio",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
