import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Icon(Icons.watch_later,
            size: 160,
            color: Colors.white,),
            Text("Segundo tab", style: TextStyle(color: Colors.white, fontSize: 20),)
        ],
      )),
    ));
  }
}
