import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String inputText="";
  final TextEditingController controller = TextEditingController();
  void onSubmitted(String value){
    setState(() {
      inputText = inputText +"\n"+value;
      controller.text="";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("texfield widget"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText:"Ingresa el texto aqui"),
              onSubmitted: onSubmitted,
              controller: controller,
            ),
            Text(inputText)
          ],
        ),
      ),
    );
  }
}
