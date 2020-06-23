import 'package:flutter/material.dart';
import 'package:loginbloc/src/bloc/provider.dart';
import 'package:loginbloc/src/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //accedemos al provider de app
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0),),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email',
              errorText: snapshot.error
          ),
          onChanged: (value) => bloc.changeEmail,
        );
      } ,
    );
  }
  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot){
        return TextField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              hintText: 'Contraseña',
              labelText: 'Contraseña',
              errorText: snapshot.error
          ),
          onChanged: (value) => bloc.changePassword,
        );
      },
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
