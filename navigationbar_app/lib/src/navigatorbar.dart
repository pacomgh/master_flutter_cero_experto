import 'package:flutter/material.dart';
import 'package:navigationbarapp/screens/first.dart';
import 'package:navigationbarapp/screens/second.dart';
import 'package:navigationbarapp/screens/third.dart';

class MyNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Navigator Bar App"),
        ),
        body: TabBarView(
          children: <Widget>[First(),Second(), Third()],
        ),
        bottomNavigationBar: Material(
          color: Colors.blueAccent,
          child: TabBar(
            tabs: <Tab>[
              Tab(icon: Icon(Icons.alarm),),
              Tab(icon: Icon(Icons.watch_later),),
              Tab(icon: Icon(Icons.airplanemode_active),),
          ]),
          ),
        ),
    );
  }
}
