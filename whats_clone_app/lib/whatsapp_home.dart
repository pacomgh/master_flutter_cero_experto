import 'package:flutter/material.dart';
import 'package:whatscloneapp/pages/calls.dart';
import 'package:whatscloneapp/pages/camera_alt.dart';
import 'package:whatscloneapp/pages/chat_list.dart';
import 'package:whatscloneapp/pages/status_screen.dart';
import 'package:whatscloneapp/pages/contacts.dart';
import 'package:camera/camera.dart';


class WhatsAppHome extends StatefulWidget {
  //varibale para usar la camara
  final List<CameraDescription> cameras;
  //recibiremos el parametro de la camara en nuestro constructor
  WhatsAppHome(this.cameras);
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}
class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter chat"),
        bottom: new TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt),),
            new Tab(text: "CHATS",),
            new Tab(text: "ESTADOS"),
            new Tab(text: "LLAMADAS",)
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: [
          //accedemos a nuestra variable cameras para enviarla por el constructor de camara
          new Camera(widget.cameras),
          new ChatList(),
          new Status(),
          new Calls()
        ],
      ),
      //usamos el floating action button que tiene el scaffold
      floatingActionButton: new FloatingActionButton(
        //definimos el color con el color del tema de la aplicacion
        backgroundColor: Theme.of(context).accentColor,
        //elegimos el icono y le damos el estilo que queremos
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        //le indicamos la accion que hara
        onPressed: (){
          //definimos el router
          var route = new MaterialPageRoute(
            //definimos la pagina que queremos traer(contacts)
            builder: (BuildContext context) => new Contacts()
          );
          ////con la funcion of nos permitimos ir hacia esa pagina
          Navigator.of(context).push(route);
        },
      ),
    );
  }
}