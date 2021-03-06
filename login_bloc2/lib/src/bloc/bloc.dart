import 'dart:async';
import 'package:loginbloc2/src/bloc/validators.dart';

class Bloc with Validators{
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Stream<String> get email => _emailController.stream.transform(validaEmail).asBroadcastStream();
  Stream<String> get password => _passwordController.stream.transform(validaPassword).asBroadcastStream();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}

//permite usar bloc fuera de esta clase sin crear una instancia en la clase externa
//final bloc = Bloc();