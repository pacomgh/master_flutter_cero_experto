import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Icon(
                Icons.alarm,
                size: 160,
                color: Colors.white,
            ),
            Text(
            "Primer tab",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      )),
    ));
  }
}
