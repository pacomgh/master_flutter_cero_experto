import 'package:flutter/material.dart';
import 'package:statelessapp/src/screens/card.dart';

class MyApp extends StatelessWidget {
  //tamaño de todos los iconos
  final double iconSize = 40.0;
  //formato de todos los textos
  final TextStyle textStyle = TextStyle(color: Colors.grey, fontSize: 30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stateless Widget"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyCard(
                title: Text("I Love Flutter", style: textStyle),
                icon: Icon(Icons.favorite, color: Colors.red, size: iconSize,),
              ),
              MyCard(
                title: Text("I Like This Video", style: textStyle),
                icon: Icon(Icons.thumb_up, color: Colors.blue, size: iconSize,),
              ),
              MyCard(
                title: Text("Next Video", style: textStyle),
                icon: Icon(Icons.queue_play_next, color: Colors.brown, size: iconSize,),
              ),
            ],
          ),
        ));
  }
}