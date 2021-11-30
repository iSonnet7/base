import 'package:flutter/material.dart';

class DrawerResults extends StatefulWidget {
  String testRes1;
  String testRes2;
  String testRes3;

  DrawerResults(this.testRes1, this.testRes2, this.testRes3);

  @override
  _DrawerResults createState() => _DrawerResults();
}

class _DrawerResults extends State<DrawerResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F9F9),
      appBar: AppBar(
        title: Text("Resultados"),
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
                    Image.asset("assets/stats.png",
                        height: MediaQuery.of(context).size.height / 6),
                  ]),
                  SizedBox(height: 25),
                  Text(
                    "Escala de ansiedad para niños de Spence:",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.testRes2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Escala de sobre-carga del cuidador Zarit:",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.testRes3,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Test de Ansiedad de Beck:",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.testRes1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 200),
                  Text(
                    "En el siguiente liga puedes encontrar ayuda de un profesional:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "https://www.psychologytoday.com/mx",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF777777),
                    ),
                  ),
                ])),
      )),
    );
  }
}
