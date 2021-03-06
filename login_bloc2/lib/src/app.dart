import 'package:flutter/material.dart';
import 'package:loginbloc2/src/bloc/provider.dart';
import 'package:loginbloc2/src/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
          home: Scaffold(
            body: LoginScreen(),
          ),
        )
    );
  }
}
