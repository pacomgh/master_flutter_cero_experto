import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatapp/src/mixins/validation_mixins.dart';
import 'package:flutterchatapp/src/services/authentication.dart';
import 'package:flutterchatapp/src/widgets/app_button.dart';
import 'package:flutterchatapp/src/widgets/app_icon.dart';
import 'package:flutterchatapp/src/widgets/app_textfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  //@override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixins{
  //estos campos los podemos usar con el controller de cada uno
  //String _email;
  //String _password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool showSpinner = false;
  FocusNode _focusNode;
  bool _autovalidate=false;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _formState,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppIcon(),
                SizedBox(height: 48.0,),
                _emailFiedl(),
                SizedBox(height: 8.0,),
                _passwordField(),
                SizedBox(height: 23.0,),
                _submitButton(),
              ],
            ),
          )
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose(){
    super.dispose();
    _focusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void setSpinnerStatus(bool status){
    setState(() {
      showSpinner = status;
    });
  }

  Widget _emailFiedl(){
    return AppTextField(
      focusNode: _focusNode,
      autovalidate: _autovalidate,
      controller: _emailController,
      validator: validateEmail,
      inputText: "Ingresar email",
      onSaved: (value){ },
    );
  }

  Widget _passwordField(){
    return AppTextField(
      autovalidate: _autovalidate,
      controller: _passwordController,
      validator: validatePassword,
      inputText: "Ingresar contraseña",
      onSaved: (value) { },
      obscureText: true,
    );
  }

  Widget _submitButton(){
    return AppButton(
        color: Colors.lightBlueAccent,
        onPressed: () async{
          if(_formState.currentState.validate()) {
            setSpinnerStatus(true);
            var user = await Authentication().loginUser(
                email: _emailController.text, password: _passwordController.text);
            if (user != null)
              Navigator.pushNamed(context, "/chat");
            FocusScope.of(context).requestFocus(_focusNode);
            _emailController.text = "";
            _passwordController.text = "";
            setSpinnerStatus(false);
          }else
            setState(() => _autovalidate=true);
        },
        name: "Log in"
    );
  }

}
