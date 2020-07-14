import 'package:flutter/material.dart';
import 'package:flutterchatapp/src/widgets/app_button.dart';
import 'package:flutterchatapp/src/widgets/app_icon.dart';
import 'package:flutterchatapp/src/widgets/app_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName='/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(height: 48.0,),
            AppTextField(inputText: "Ingresa tu email",
            onChanged: (value){ _email = value;
            print('Email: $_email');},),
            SizedBox(height: 8.0,),
            AppTextField(inputText: "Ingresa tu contraseña",
            obscureText: true,
            onChanged: (value){ _password = value;
            print('Email: $_email'); },),
            SizedBox(height: 23.0,),
            AppButton(
              color: Colors.blueAccent,
              onPressed: (){},
              name: "Sing in"
            )
          ],
        ),
      ),
    );
  }
}
