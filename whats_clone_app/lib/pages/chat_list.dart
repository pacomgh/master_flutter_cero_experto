import 'package:flutter/material.dart';
import 'package:whatscloneapp/models/chat_model.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    //este widget nos permite utilizar el modelo que tenemos creado
    return new ListView.builder(
      itemCount: messageData.length,
      itemBuilder: (context, i) => new Column(
        children: [
          new Divider(
            height: 10,
          ),
          new ListTile(
            //colocamos una imagen de contacto de forma circular
            leading: new CircleAvatar(
              //messageData[0].atributo, accede al atributo en la posicion que queremos
              backgroundImage: NetworkImage(messageData[i].imageUrl),
            ),
          ),
        ],
      )
    );
  }
}

