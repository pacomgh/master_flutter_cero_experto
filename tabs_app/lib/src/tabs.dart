import 'package:flutter/material.dart';
import 'package:tabsapp/screens/contact.dart';
import 'package:tabsapp/screens/home.dart';
import 'package:tabsapp/screens/video.dart';

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("Video tabs"),
            bottom: TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.ondemand_video),),
              Tab(icon: Icon(Icons.contacts),)
            ],),
        ),
          body: TabBarView(children: <Widget>[
            Home(), Video(), Contact()
          ],),
      ),
    );
  }
}
