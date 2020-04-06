import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Icon(Icons.airplanemode_active,
                size: 160,
                color: Colors.white,),
              Text("Terrcer tab", style: TextStyle(color: Colors.white, fontSize: 20),)
        ],
      )),
    ));
  }
}
