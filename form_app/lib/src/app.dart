import 'package:flutter/material.dart';
import 'package:formapp/src/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Iniciar Sesión",
      home: LoginScreen(),
    );
  }
}

