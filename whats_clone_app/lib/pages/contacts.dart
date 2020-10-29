//este widget se usara para mostrar los contactos al presionar el voton de nuevo mensaje
import 'package:flutter/material.dart';
class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Selecciona un contacto"),
      ),
    );
  }
}
