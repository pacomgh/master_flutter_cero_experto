import 'package:flutter/material.dart';
import 'package:listviewapp/src/model/contact_model.dart';
import 'package:listviewapp/src/screens/contact_item.dart';

class Contact extends StatelessWidget {
  //const Contact({Key key}): super(key:key);

  buildList(){
    return <ContactModel>[
      ContactModel(name: "Francisco Guzman", email: "paco.mgh@gmail.com"),
      ContactModel(name: "Pedro Perez", email: "pedroperez.52@hotmail.com"),
      ContactModel(name: "Javier Cortes", email: "javier08cortez@hotmail.com"),
      ContactModel(name: "Jose Perez", email: "jose.prz.1@outlook.com"),
      ContactModel(name: "Juan Torres", email: "torresj.uan@outlook.com"),
      ContactModel(name: "Edgar Aguirre", email: "eaguirret@outlook.com"),
      ContactModel(name: "Juan Francisco", email: "pancho930302@gmail.com"),
      ContactModel(name: "Juan Ramirezn", email: "rjuan9121@gmail.com"),
    ];
  }

  List<ContactItem> buildContacList(){
    return buildList()
        .map<ContactItem>((contact)=> ContactItem(contact)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos"),
      ),
      body: ListView(
        children: buildContacList()
      ),
    );
  }
}
