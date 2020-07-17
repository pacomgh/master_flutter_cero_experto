import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String inputText;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;

  const AppTextField({
    this.inputText, this.onChanged, this.obscureText, this.controller,
    this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintText: inputText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.blueAccent, width: 2)
          )
      ),
      onChanged: onChanged,
      textAlign: TextAlign.center,
      obscureText: obscureText == null ? false : obscureText,
    );
  }
}
