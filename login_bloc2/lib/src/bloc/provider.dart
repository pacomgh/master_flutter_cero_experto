import 'package:flutter/material.dart';
import 'package:loginbloc2/src/bloc/bloc.dart';

class Provider extends InheritedWidget{
  Provider({Key key, Widget child}) : super(key: key, child: child);

  final bloc = Bloc();
  @override
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;

}