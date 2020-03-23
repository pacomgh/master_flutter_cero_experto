import 'package:flutter/material.dart';

//Creacion de una clase de tipo widget que se reutilizaz para no tener tanto codig
class MyCard extends StatelessWidget {
  final Widget title;
  final Widget icon;

  MyCard({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                /*Text("I Love Flutter",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 30.0))*/
                this.title,
                this.icon
                /*Icon(
                  Icons.favorite, color: Colors.red, size: 40.0,)*/
                ,
              ],
            )
        )
    );
  }
}