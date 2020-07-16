import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatapp/src/services/authentication.dart';
import 'package:flutterchatapp/src/widgets/app_button.dart';
import 'package:flutterchatapp/src/widgets/app_icon.dart';
import 'package:flutterchatapp/src/widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  //@override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            AppTextField(
              inputText: "Ingresar email",
              onChanged: (value){ _email = value;},
            ),
            SizedBox(height: 8.0,),
            AppTextField(
              inputText: "Ingresar contraseña",
              onChanged: (value) { _password = value; },
              obscureText: true,
            ),
            SizedBox(height: 23.0,),
            AppButton(
              color: Colors.lightBlueAccent,
              onPressed: () async{
                var user = Authentication().loginUser(email: _email, password:_password);
                if(user != null)
                  Navigator.pushNamed(context, "/chat");
              },
              name: "Log in"
            ),
          ],
        ),
      ),
    );
  }
}
