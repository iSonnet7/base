import 'package:base/services/base_user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserService colle = new UserService();
  final user = FirebaseAuth.instance;

  late TextEditingController _nameController;
  late TextEditingController _ageController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
    getNombre();
    getEdad();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void getNombre() async {
    String nombre = "";
    nombre = await colle.getName();
    print(nombre + "\n\nNombre devuelto");
    _nameController.text = nombre;
  }

  void getEdad() async {
    String edad = "";
    edad = await colle.getAge();
    _ageController.text = edad;
    print(edad + "\n\nEdad devuelta");
  }

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
                  SizedBox(height: 20),
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
                    _nameController.text.trim(),
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
                    _ageController.text.trim(),
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
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Resultado 1 ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Loquito",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Resultado 2 ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Medio depresivo",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Resultado 3 ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Medio suicida",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  ),
                ])),
      )),
    );
  }
}
