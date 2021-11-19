import 'package:base/screens/login.dart';
import 'package:base/screens/profile.dart';
import 'package:base/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance;
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F9F9),
      appBar: AppBar(
        title: Text("CONOCE TU MENTE"),
        backgroundColor: Color(0xFF318FB5),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Usuario'),
              accountEmail: Text(user.currentUser!.email!),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: new Image.asset("assets/profile.png"),
              ),
            ),
            ListTile(
              title: Text('Perfil'),
              leading: Icon(
                Icons.account_circle_outlined,
                color: Colors.cyan,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
            ListTile(
              title: Text('Resultados'),
              leading: Icon(
                Icons.assessment_outlined,
                color: Colors.cyan,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('Salir'),
              leading: Icon(
                Icons.login_outlined,
                color: Colors.cyan,
              ),
              onTap: () {
                auth.singOut();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(height: 70),
                      Image.asset("assets/main.jpeg",
                          height: MediaQuery.of(context).size.height / 6),
                    ]),
                    SizedBox(height: 20),
                    Text(
                      "Debido a que los problemas que enfrentan las personas son más complejos, con ayuda de esta aplicación planeamos ayudar a esas personas para orientarlos a ser autocríticos de sus comportamientos de acuerdo a las circunstancias en las que se encuentren.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF777777),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 320,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD8E3E7),
                              border: Border.all(
                                  color: Color(0xFF4B778D), width: 2),
                              borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget> [
                              Text(
                                "Test de Escala de ansiedad para niños de Spence: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Un instrumento infantojuvenil que evalúa los trastornos de ansiedad tal como se establecen en el DSM-IV. Formada por 38 ítems que evalúan síntomas de ansiedad frecuentes en niños, consta de 6 subescalas.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 20),
                              MaterialButton(onPressed: (){},
                                height: 40,
                                minWidth: 25,
                                color: Color(0xFF318FB5),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Realizar",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 320,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD8E3E7),
                              border: Border.all(
                                  color: Color(0xFF4B778D), width: 2),
                              borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget> [
                              Text(
                                "Test de Escala de sobre carga del cuidador Zarit: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "La Escala de Zarit es una escala de 22 preguntas diseñada para valorar la sobrecarga del cuidador, ampliamente utilizada en estudios de dependencia en atención primaria. Establece los diferentes grados de sobrecarga en función de la puntuación obtenida.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 20),
                              MaterialButton(onPressed: (){},
                                height: 40,
                                minWidth: 25,
                                color: Color(0xFF318FB5),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Realizar",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 320,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD8E3E7),
                              border: Border.all(
                                  color: Color(0xFF4B778D), width: 2),
                              borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget> [
                              Text(
                                "Test de Ansiedad de Beck: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "El Inventario de Ansiedad de Beck es una herramienta útil para valorar los síntomas somáticos de ansiedad, tanto en desórdenes de ansiedad como en cuadros depresivos. El cuestionario consta de 21 preguntas, en donde cada uno de los items es parte de una lista de síntomas de ansiedad.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 20),
                              MaterialButton(onPressed: (){},
                                height: 40,
                                minWidth: 25,
                                color: Color(0xFF318FB5),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Realizar",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ])),
        ),
      ),
    );
  }
}
