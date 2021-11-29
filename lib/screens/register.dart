import 'package:base/screens/home.dart';
import 'package:base/screens/login.dart';
import 'package:base/services/auth_service.dart';
import 'package:base/services/base_user_service.dart';
import 'package:base/services/base_user_service_two.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset("assets/splash.png",
                        height: MediaQuery.of(context).size.height / 6),
                  ]),
                  SizedBox(height: 50),
                  Text(
                    "Bienvenido",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Crear cuenta para continuar",
                    style: TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _nameController,
                    validator: (val) => val!.isNotEmpty
                        ? null
                        : "Por favor, introduzca su nombre",
                    decoration: InputDecoration(
                        hintText: "Nombre",
                        prefixIcon: Icon(Icons.add_road_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                    validator: (val) => val!.isNotEmpty
                        ? null
                        : "Por favor, introduzca su edad",
                    decoration: InputDecoration(
                        hintText: "Edad",
                        prefixIcon: Icon(Icons.cake_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _emailController,
                    validator: (val) => val!.isNotEmpty
                        ? null
                        : "Por favor, introduzca una dirección electronica",
                    decoration: InputDecoration(
                        hintText: "Correo",
                        prefixIcon: Icon(Icons.mail_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                      controller: _passwordController,
                      validator: (val) => val!.isNotEmpty
                          ? null
                          : "Por favor, introduzca una contraseña",
                      decoration: InputDecoration(
                          hintText: "Contraseña",
                          prefixIcon: Icon(Icons.vpn_key_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      obscureText: true),
                  SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        AuthService auth = AuthService();
                        UserServiceTwo us = UserServiceTwo();
                        UserCredential user = await auth.register(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                        await us.addUser(
                            _nameController.text.trim(),
                            _ageController.text.trim(),
                            user.user!.uid.trim(),
                            "",
                            "",
                            "");

                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        }
                      }
                    },
                    height: 70,
                    minWidth: double.infinity,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Registrar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("¿Tiene una cuenta? "),
                      SizedBox(width: 10),
                      TextButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text("Iniciar sesión"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
