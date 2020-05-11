import 'package:flutter/material.dart';
import 'dart:math';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista infinita"),
      ),
      body: ListView.builder(
        itemBuilder: (context, i){
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Producto $i'),
            subtitle: Text('Precio: ${Random().nextInt(100)} USD'),
          );
        }
      ),
    );
  }
}

