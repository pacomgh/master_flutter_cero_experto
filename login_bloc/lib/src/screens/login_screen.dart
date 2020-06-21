import 'package:flutter/material.dart';
import 'package:loginbloc/src/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  final bloc = Bloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 25.0),),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'Email',
        errorText: ''
      ),
      onChanged: (value) => bloc.changeEmail,
    );
  }
  Widget passwordField(){
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        labelText: 'Contraseña'
      ),
      onChanged: (value) => bloc.changePassword,
    );
  }
  Widget submitButton(){
    return RaisedButton(
      child: Text('Enviar'),
      onPressed: (){},
      color: Colors.blueAccent,
      textColor: Colors.white,
    );
  }
}
