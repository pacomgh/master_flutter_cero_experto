import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
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
            Row(
              children: <Widget>[
                Image.asset('images/logo.png'),
                Text("Flutter chat",
                    style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600))
              ],
            ),
            SizedBox(height: 48.0,),
            getButton(Colors.lightBlueAccent, "Log in", (){}),
            getButton(Colors.blueAccent, "Sign in", (){})
          ],
        ),
      ),
    );
  }

  Widget getButton(MaterialAccentColor color, String name, VoidCallback onPress){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: SizedBox(
          height: 43.0,
          child: FlatButton(
            child: Text(name, style: TextStyle(color: Colors.white),),
            onPressed: onPress,
        )),
      ),
    );
  }
}
