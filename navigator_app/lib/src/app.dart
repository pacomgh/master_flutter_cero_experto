import 'package:flutter/material.dart';
import 'package:navigatorapp/src/screens/second.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primera pantalla"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Primera pantalla"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder:(context) => Second(title: "Hola"),

            ));
          },
        ),
      ),
    );
  }
}
