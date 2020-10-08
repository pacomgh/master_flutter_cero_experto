import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatscloneapp/models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen({this.name});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  //variable para controlar el envio de mensajes cuando nos e escribe algo
  bool _isTyped = false;
  //sirve como un notificador para saber cuandop cambio el texto
  final TextEditingController _textController = new TextEditingController();
  //variable que almacena los mensajes que recibimos
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          //accedemos a la propiedad a traves de widget
          title: new Text(widget.name)),
      body: new Container(
        child: new Column(
          children: [
            //mandamos la lista de mensajes
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8),
                //seteando reverse esta propiedad en true, el widget muestra la informacion
                //desde abajo hacia arriba
                reverse: true,
                //desde donde la obtenemos
                itemBuilder: (_, int index) => _messages[index],
                //item counr nos devuelve la cantidad de mensajes que le indiquemos
                itemCount: _messages.length,
              )
            ),
            new Divider(
              height: 1,
            ),
            new Container(
              child:
                  _buildTextComposer(), //aqui se comienza a dibujar el contenido
            )
          ],
        ),
      ),
    );
  }

  void _handledSubmit(String text){
    //limpiamos el contenido del texto cuando se dispara el evento, es decir picamos enviar
    _textController.clear();
    //reseteamos la bandera isTyped para que el valor sea falso y no se envie texto
    setState(() {
      _isTyped = false;
    });
    //recibimos el mensaje que se envia del widget principal y enviarlo a este widget
    //despues de que lo tome lo agregamos a la lista a traves de setState
    //setState nos permitira redibujar el widget para poder tomar la coleccion desde otros lugares
    ChatMessage message = new ChatMessage(
      //mandamos los parametros definidos en el constructoe de nuestra clase
      text: text,
      //madamos el controlador
      animationController: new AnimationController(
        //pasamos la diracion de la animacion
        duration: new Duration(milliseconds: 700),
        vsync: this
      ),
      //pasamos el nombre desde este widget
      name: widget.name,
    );
    //insertamos el widget que creamos, esto en el settate
    setState(() {
      _messages.insert(0, message);
      //hacemos que se muestre el ultimo mensaje
      //guardamos en una variable el contenido que se obtiene del ultimo mensaje
      //retornamos el contenido que es igual al contenido de este nombre
      var data = messageData.firstWhere((t) => t.name == widget.name);
    //actualizamos el mensje que se muestra, va a ser igual al mensaje que ingresamos
      //en el texto
      data.message = message.text;
    });
    //iondicamos que el animation controller empiece a correr la animacion
    message.animationController.forward();
    //revisamos si lo que enviamos se recibe correctamente
    print(text);
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
                  onChanged: (String text){
                    setState(() {
                      //si contiene algo regresa un true, sino un false
                      _isTyped = text.length > 0;
                    });
                  },
                  //colocamos un placeholder para envuiar un mensaje
                  decoration: new InputDecoration.collapsed(hintText: "Enviar mensaje"),
                ),
              ),
              new Container(
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    //si istyped es true habilita el boton y envia mensaje
                    onPressed: _isTyped ?
                        () => _handledSubmit(_textController.text) : null,
                  ),
              ),
            ],
          ),
        )
    );
  }
}

//este widget nos permite manejar los mensjhes
class ChatMessage extends StatelessWidget {
  //necesitamos el mensaje, animationController y el nombre del contacto
  ChatMessage({this.text, this.animationController, this.name});
  final String text;
  final AnimationController animationController;
  final String name;
  @override
  Widget build(BuildContext context) {
    //sizeTransition proporciona un tipo de animacion para mostrar en una transicion
    //los mensajes
    return SizeTransition(
      //tipo de animacion que vamos a utilizar
      sizeFactor: new CurvedAnimation(
        //se maneja a traves del animation controller, este controla la velocidad de la animacion
          parent: animationController,
          //defino el tipo de animacion que se usa
          curve: Curves.easeOut
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //definimos los widget que tendra
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16),
              //definimos el icono redondo que tendra
              child: new CircleAvatar(
                //recibe el nombre, solo la letra
                child: new Text(name[0]),
              ),
            ),
            ////este widget se expande para ocupar el espacio habilitado
            new Expanded(
              child: new Column(
                //alineamos el contenido(texto hacia el iniciod el widget
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //llamamos al texto del nombre del contacto que lo envia
                  new Text(name, style: Theme.of(context).textTheme.subtitle1,),
                  new Container(
                    margin: const EdgeInsets.only(top: 5),
                    //colocamos el mensaje
                    child: new Text(text),
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
