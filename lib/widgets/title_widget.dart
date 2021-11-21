import 'package:flutter/material.dart';

class AppLogo extends StatefulWidget {
  final String quizTitle;

  AppLogo({required this.quizTitle});

  @override
  _AppLogo createState() => _AppLogo();
}

class _AppLogo extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: widget.quizTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.8))),
        ],
      ),
    );
  }
}
