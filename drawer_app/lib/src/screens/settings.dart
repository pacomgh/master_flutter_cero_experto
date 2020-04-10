import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Settings({Key key}): super(key: key);
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
