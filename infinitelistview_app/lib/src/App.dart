import 'package:flutter/material.dart';
import 'dart:math';
import 'package:english_words/english_words.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final suggestions = <WordPair>[];

  ListTile buildRow(WordPair pair){
    return ListTile(
      trailing: Icon(Icons.favorite),
      title: Text(pair.asCamelCase),
      //subtitle: Text('Precio: ${Random().nextInt(100)} USD'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista infinita"),
      ),
      body: ListView.builder(
        itemBuilder: (context, i){
          if(i.isOdd) return Divider();

          if(i>=suggestions.length){
            suggestions.addAll(generateWordPairs().take(10));
          }

          return buildRow(suggestions[i]);
        }
      ),
    );
  }
}

