import 'package:flutter/material.dart';
import 'package:flutterchatapp/screens/login_screen.dart';
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
        initialRoute: WelcomeScreen.routeName,
        routes: <String, WidgetBuilder>{
          LoginScreen.routeName:(BuildContext context) =>LoginScreen(),
          WelcomeScreen.routeName:(BuildContext context) =>WelcomeScreen(),
        },
      )
  );
}