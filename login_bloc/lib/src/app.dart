import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loginbloc/src/screens/login_screen.dart';
import 'package:loginbloc/src/bloc/bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Bloc>(
      create: (context) => Bloc(),
      dispose: (context, bloc) => bloc.dispose(),
        child: MaterialApp(
          home: Scaffold(
            body: LoginScreen(),
          ),
        )
    );
  }
}
