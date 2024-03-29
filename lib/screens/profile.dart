import 'dart:io';

import 'package:base/services/base_user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  String nombre;
  String edad;

  Profile(this.nombre, this.edad);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F9F9),
      appBar: AppBar(
        title: Text("Perfil"),
        backgroundColor: Color(0xFF318FB5),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(height: 70),
                    Image.asset("assets/photo.png",
                        height: MediaQuery.of(context).size.height / 6),
                  ]),
                  SizedBox(height: 2),
                  Text(
                    "Nombre ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.nombre,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Edad",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.edad,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Correo ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    user.currentUser!.email!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  )
                ])),
      )),
    );
  }
}
