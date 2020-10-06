import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;

  ChatScreen({this.name});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  //sirve como un notificador para saber cuandop cambio el texto
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          //accedemos a la propiedad a traves de widget
          title: new Text(widget.name)),
      body: new Container(
        child: new Column(
          children: [
            new Container(
              child:
                  _buildTextComposer(), //aqui se comienza a dibujar el contenido
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
        //usa el color de la pantalla padre(coontexto)
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          //contenido de la pantalla de chat
          child: new Row(
            children: <Widget>[
              //flexible coloca el contenido en el espacio habilitado apra determinado
              //eje que ocupa el texto
              new Flexible(
                child: new TextField(
                  controller: _textController,
                ),
              ),
              new Container(
                child: new IconButton(
                    icon: new Icon(Icons.send), onPressed: () => {}),
              ),
            ],
          ),
        )
    );
  }
}
