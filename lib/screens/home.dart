import 'package:base/screens/login.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('Usuario'), accountEmail: Text(user.currentUser!.email!),
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
              onTap: () {},
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
                Icons.logout_outlined,
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
    );
  }
}
