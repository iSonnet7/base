import 'package:base/screens/home.dart';
import 'package:base/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);

    if(user.currentUser != null){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      );
    }
  }
}
