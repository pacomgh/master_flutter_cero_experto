import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  MyDialog({Key key}):super(key:key);
  @override
  _MyDialogState createState() => _MyDialogState();
}

enum DialogAction{
  yes,
  no
}

class _MyDialogState extends State<MyDialog> {

  void alertResult(DialogAction action){
    print("Tu seleccion es $action");
  }
  void showAlert(){
    AlertDialog dialog = AlertDialog(
      content: Text("Paco"),
      actions: <Widget>[
        FlatButton(
          child: Text("Si"),
          onPressed: (){alertResult(DialogAction.yes);},
        ),
        FlatButton(
          child: Text("No"),
          onPressed: (){alertResult(DialogAction.no);},
        )
      ],
    );

    showDialog(context: context, builder: (BuildContext context){return dialog;});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog widget"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Ingresa el texto aqui"),
              //onSubmitted: onSubmitted,
              //controller: controller,
            ),
            RaisedButton(
              child: Text("ver alerta"),
              onPressed: showAlert,
            ),
          ],
        ),
      ),
    );
  }
}
