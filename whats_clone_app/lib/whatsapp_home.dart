import 'package:flutter/material.dart';
import 'package:whatscloneapp/pages/calls.dart';
import 'package:whatscloneapp/pages/camera_alt.dart';
import 'package:whatscloneapp/pages/chat_list.dart';
import 'package:whatscloneapp/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}
class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter chat"),
        bottom: new TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt),),
            new Tab(text: "CHATS",),
            new Tab(text: "ESTADOS"),
            new Tab(text: "LLAMADAS",)
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: [
          new Camera(),
          new ChatList(),
          new Status(),
          new Calls()
        ],
      ),
      /*body: new DefaultTabController(
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
      ),*/
    );
  }
}