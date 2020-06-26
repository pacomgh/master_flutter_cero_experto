import 'dart:async';
import 'package:loginbloc/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators{
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get email => _emailController.stream.transform(validaEmail).asBroadcastStream();
  Stream<String> get password => _passwordController.stream.transform(validaPassword).asBroadcastStream();

  Stream<bool> get submitValid => CombineLatestStream.combine2(email, password, (a,b) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}

//permite usar bloc fuera de esta clase sin crear una instancia en la clase externa
//final bloc = Bloc();