import 'package:flutter/material.dart';
import 'package:whatscloneapp/models/chat_model.dart';
import 'package:whatscloneapp/pages/chat_screen.dart';

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
            title: new Row(
              //esta propiedad permite dar espacio entre los dos elementos
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  messageData[i].name,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  messageData[i].time,
                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
            //permite agregar un subtitulo en el row
            subtitle: new Container(
              padding: const EdgeInsets.only(top: 5.0),//only da padding en una sola direccion
              child: new Text(
                messageData[i].message,
                style: new TextStyle(color: Colors.grey, fontSize: 15.0),

              ),
            ),
            //callback para hacer la navegacion
            onTap: (){
              //declaramos el route para el cambio de pagina
              var route = new MaterialPageRoute(
                //indicamos cual es la pagina que vamos a utilizar
                builder: (BuildContext context) => new ChatScreen(name: messageData[i].name)
              );
              Navigator.of(context).push(route);
            },
          ),
        ],
      )
    );
  }
}

