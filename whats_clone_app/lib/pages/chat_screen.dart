import 'package:flutter/material.dart';
    class ChatScreen extends StatefulWidget {
      final String name;
      ChatScreen({this.name});
      @override
      _ChatScreenState createState() => _ChatScreenState();
    }
    
    class _ChatScreenState extends State<ChatScreen> {
      @override
      Widget build(BuildContext context) {
        return Container(
          //accedemos a la propiedad a traves de widget
          child: new Text(widget.name)
        );
      }
    }
    