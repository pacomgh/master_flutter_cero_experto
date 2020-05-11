import 'package:flutter/material.dart';
import 'package:listviewapp/src/model/contact_model.dart';

class ContactItem extends StatelessWidget {
  //const ContactItem({Key key}): super(key:key);
  final ContactModel contact;
  ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(contact.name[0]),),
      title: Text(contact.name),
      subtitle: Text(contact.email),
    );
  }
}
