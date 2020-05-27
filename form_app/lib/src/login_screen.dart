import 'package:flutter/material.dart';
import 'package:formapp/src/mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidatorMixins {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
             emailField(),
            passwordField(),
            Container(margin: EdgeInsets.all(20.0),),
            submitField()
          ],
        ),
      ),
    );
  }

  //helper methods
  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "you@example.com"
      ),
      validator: validateEmail,
      onSaved: (value){
        print("save"+value);
      },
    );
  }
  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: "Contraseña"
      ),
      validator: validatePassword,
      onSaved: (value){
        print("save"+value);
      },
    );
  }
  Widget submitField(){
    return RaisedButton(
      child: Text("Enviar"),
      color: Colors.blueAccent,
      textColor: Colors.white,
      onPressed: (){
        if(formKey.currentState.validate())
          formKey.currentState.save();
      },
    );
  }
}
