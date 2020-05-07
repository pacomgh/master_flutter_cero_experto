import 'package:flutter/material.dart';
import 'package:listviewapp/src/screens/contact_item.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos"),
      ),
      body: ListView(
        children: <Widget>[
          ContactItem()
        ],
      ),
    );
  }
}
