import 'package:flutter/material.dart';

class TitleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        size: 22,
        color: Colors.white,
      ),
    );
  }
}
