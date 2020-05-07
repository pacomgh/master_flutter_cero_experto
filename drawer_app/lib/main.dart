import 'package:drawerapp/src/home.dart';
import 'package:drawerapp/src/screens/battery.dart';
import 'package:drawerapp/src/screens/settings.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Home(),
      routes: <String, WidgetBuilder>{
        Settings.routeName:(BuildContext context)=>Settings(),
        Battery.routeNAme:(BuildContext context)=>Battery(),
      },
    )
  );
}