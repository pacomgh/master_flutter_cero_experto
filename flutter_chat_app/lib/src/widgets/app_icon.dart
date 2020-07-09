import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset('images/logo.png'),
        Text("Flutter chat",
            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600))
      ],
    );
  }
}
