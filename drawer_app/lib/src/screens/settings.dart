import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}): super(key: key);
  static const String routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla configuraciom"),),
      body: Container(
        child: Center(
          child: Text("Configuracion"),
        ),
      ),
    );
  }
}
