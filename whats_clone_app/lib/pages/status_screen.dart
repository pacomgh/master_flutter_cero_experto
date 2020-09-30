import 'package:flutter/material.dart';
import 'package:whatscloneapp/models/status_model.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: [
          new ListTile(
            leading: new CircleAvatar(
              //estilos para la imagen
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(status[0].imgUrl),
            ),
            title: new Text(
              status[0].name,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: new Text("añadir a mi estado"),
          ),
          new Text(
              "Recientes",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
            ),
          ),
          new ListTile(
            leading: new CircleAvatar(
              //estilos para la imagen
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(status[1].imgUrl),
            ),
            title: new Text(
              status[1].name,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: new Text("añadir a mi estado"),
          ),
          new Divider(height: 10,),
          new ListTile(
            leading: new CircleAvatar(
              //estilos para la imagen
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(status[2].imgUrl),
            ),
            title: new Text(
              status[2].name,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: new Text("añadir a mi estado"),
          ),
        ],
      ),
    );
  }
}

