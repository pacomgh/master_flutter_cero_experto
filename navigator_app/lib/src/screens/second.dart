import 'package:flutter/material.dart';
import 'package:navigatorapp/src/app.dart';

class Second extends StatelessWidget {
  //const Second({Key key}) : super(key: key);
  final String title;
  Second({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Ir atras"),
          onPressed: (){ Navigator.pop(context);},
        ),
      ),
    );
  }
}
