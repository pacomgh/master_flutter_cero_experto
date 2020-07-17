import 'package:flutter/material.dart';
import 'package:flutterchatapp/src/services/authentication.dart';
import 'package:flutterchatapp/src/widgets/app_button.dart';
import 'package:flutterchatapp/src/widgets/app_icon.dart';
import 'package:flutterchatapp/src/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName='/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //_ indica que los atributos sin privados, solo se usan en la clase
  String _email;
  String _password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _focusNode;

  @override
  void dispose(){
    super.dispose();
    _focusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //agrega un padding, edgeinsets.symetric agrega un espacio de forma
        //horizontal o vertical
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(height: 48.0,),
            AppTextField(
              focusNode: _focusNode,
              controller: _emailController,
              inputText: "Ingresa tu email",
              onChanged: (value){ _email = value;
              print('Email: $_email');},),
              //sizedbox agrega un espaciado de la altura indicada
            SizedBox(height: 8.0,),
            AppTextField(
              controller: _passwordController,
              inputText: "Ingresa tu contraseña",
              //oculta la contraseña
              obscureText: true,
              onChanged: (value){ _password = value;
              /*print('Email: $_email');*/ },),
            SizedBox(height: 23.0,),
            AppButton(
              color: Colors.blueAccent,
              onPressed: () async {
                var newUser = await Authentication().createUser(email: _email, password: _password);
                if(newUser!=null)
                  Navigator.pushNamed(context, '/chat');
                _emailController.text = "";
                _passwordController.text = "";
                FocusScope.of(context).requestFocus(_focusNode);
              },
              name: "Sing in"
            )
          ],
        ),
      ),
    );
  }
}
