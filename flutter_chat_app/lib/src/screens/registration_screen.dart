import 'package:flutter/material.dart';
import 'package:flutterchatapp/src/mixins/validation_mixins.dart';
import 'package:flutterchatapp/src/services/authentication.dart';
import 'package:flutterchatapp/src/widgets/app_button.dart';
import 'package:flutterchatapp/src/widgets/app_error_message.dart';
import 'package:flutterchatapp/src/widgets/app_icon.dart';
import 'package:flutterchatapp/src/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName='/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with ValidationMixins {
  //_ indica que los atributos sin privados, solo se usan en la clase
  String _email;
  String _password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _focusNode;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  String _errorMessage = "";

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
      body: Form(
        key: _formKey,
          child: Container(
        //agrega un padding, edgeinsets.symetric agrega un espacio de forma
        //horizontal o vertical
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              AppIcon(),
              SizedBox(height: 48.0,),
              _emailField(),
              //sizedbox agrega un espaciado de la altura indicada
              SizedBox(height: 8.0,),
              _passwordField(),
              SizedBox(height: 23.0,),
              _showErrorMessage(),
              _submitButton(),
            ],
          ),
        )
      ),
    );
  }

  Widget _emailField(){
    return AppTextField(
      focusNode: _focusNode,
      autovalidate: _autovalidate,
      validator: validateEmail,
      controller: _emailController,
      inputText: "Ingresa tu email",
      onSaved: (value){},
    );
  }

  Widget _passwordField(){
    return AppTextField(
      autovalidate: _autovalidate,
      validator: validatePassword,
      controller: _passwordController,
      inputText: "Ingresa tu contraseña",
      //oculta la contraseña
      obscureText: true,
      onSaved: (value){},
    );
  }

  Widget _submitButton(){
    return AppButton(
        color: Colors.blueAccent,
        onPressed: () async {
          if(_formKey.currentState.validate()) {
            var auth = await Authentication().createUser(
                email: _emailController.text, password: _passwordController.text
            );
            if (auth.success) {
              Navigator.pushNamed(context, '/chat');
              _emailController.text = "";
              _passwordController.text = "";
              FocusScope.of(context).requestFocus(_focusNode);
            }else{
              setState(() {
                _errorMessage = auth.errorMessage;
              });
            }
          }else{
            setState(() => _autovalidate=true);
          }
        },
        name: "Sing in"
    );
  }

  Widget _showErrorMessage(){
    if(_errorMessage.length > 0 && _errorMessage != null)
      return ErrorMessage(errorMessage: _errorMessage);
    else
      return Container(
        height: 0.0,
      );
  }
}
