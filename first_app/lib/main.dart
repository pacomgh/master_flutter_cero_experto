import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Primera aplicacion en flutter"),
      ),

      body: Container(
        child: Center(
          child: Text("Hello World", style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){print("click");},
        child: Icon(Icons.add),
      ),
    )
  );

  runApp(app);
}