import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text("F"),),
      title: Text("Francisco"),
      subtitle: Text("paco.mgh@gmail.com"),
    );
  }
}
