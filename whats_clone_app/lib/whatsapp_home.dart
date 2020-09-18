import 'package:flutter/material.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}
class _WhatsAppHomeState extends State<WhatsAppHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter chat"),
      ),
      body: new DefaultTabController(
        length: 4,
        child: new Container(
          color: Colors.green,
          child: new TabBar(
            tabs: [
              Tab( icon: Icon(Icons.camera),),
              Tab( text: "CHATS",),
              Tab( text: "STATUS",),
              Tab( text: "CALLS",)
            ],
          ),
        ),
      ),
    );
  }
}