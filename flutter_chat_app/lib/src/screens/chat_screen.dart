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
                    List<ChatItem> chatItems = [];
                    for(var message in messages){
                      var messageValue = message.data["value"];
                      var messageSender = message.data["sender"];
                      chatItems.add(ChatItem(message: messageValue, sender: messageSender,));
                    }
                    return Flexible(
                        child: ListView(
                          children: chatItems,
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

class ChatItem extends StatelessWidget {
  final String sender;
  final String message;
  ChatItem({this.sender, this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black54
            ),
          ),
          Material(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                message,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}
