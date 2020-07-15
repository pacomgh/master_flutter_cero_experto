import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/char';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
      ),
    );
  }
}
