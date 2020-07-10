import 'package:flutter/material.dart';
import 'package:flutterchatapp/src/widgets/app_button.dart';
import 'package:flutterchatapp/src/widgets/app_icon.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            AppButton(
             color: Colors.lightBlueAccent,
             onPressed: (){Navigator.pushNamed(context, '/login');},
             name: "Log in",
            ),
            AppButton(
              color: Colors.blueAccent,
              onPressed: (){Navigator.pushNamed(context, '/registration');},
              name: "Sign in",
            ),
          ],
        ),
      ),
    );
  }

  Widget getButton(MaterialAccentColor color, String name, VoidCallback onPress){
    return AppButton();
  }
}
