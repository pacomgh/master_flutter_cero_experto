import 'package:flutter/material.dart';
import 'package:flutterchatapp/screens/welcome_screen.dart';

void main(){
  runApp(
      MaterialApp(
        home: WelcomeScreen(),
        theme: ThemeData(
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.black45)
          )
        ),
      )
  );
}