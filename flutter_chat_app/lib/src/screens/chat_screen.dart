import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatapp/src/services/authentication.dart';
//importa firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterchatapp/src/services/message_service.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  final _firestore = Firestore.instance;//crea instancia de firestore
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    _getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat Screen"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                Authentication().singOut();
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: MessageService().getMessageStream(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    var messages = snapshot.data.documents;
                    List<Text> messageWidgets = [];
                    for(var message in messages){
                      var messageValue = message.data["value"];
                      var messageSender = message.data["sender"];
                      messageWidgets.add(
                        Text(
                          '$messageValue de $messageSender',
                          style: TextStyle(fontSize: 30.0),),
                      );
                    }
                    return Flexible(
                        child: ListView(
                          children: messageWidgets,
                        )
                    );
                  }
                },
              ),
              Container(
                decoration: _messageContainerDecoration,
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: _messageTextFieldDecoration,
                      controller: _messageController,
                    ),
                  ),
                  FlatButton(
                    child: Text("Enviar", style: _sendButtonStyle,),
                    onPressed: () {
                      MessageService().save(
                          collectionName: "messages",
                          collectionValues:{
                            'value': _messageController.text,
                            'sender': loggedInUser.email
                          });
                    },
                  ),
                ]
                ),
              ),
            ],
          ),
        ));
  }

  void getCurrentUser() async {
    try {
      var user = await auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        //print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void _getMessages() async{
    //final snapshots = await MessageService().getMessageStream();
    //recorremos los valores de snapshot
    await for (var snapshot in MessageService().getMessageStream())
    for (var message in snapshot.documents)
      print(message.data);
  }

  InputDecoration _messageTextFieldDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      hintText: 'Ingresa tu mensaje aquí',
      border: InputBorder.none);

  BoxDecoration _messageContainerDecoration = BoxDecoration(
      border:
          Border(top: BorderSide(color: Colors.lightBlueAccent, width: 2.0)));

  TextStyle _sendButtonStyle = TextStyle(
    color: Colors.lightBlueAccent, fontWeight: FontWeight.bold, fontSize: 18.0
  );
}
