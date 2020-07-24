import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterchatapp/src/model/auth_request.dart';

class Authentication{
  //crea un singleton de firebase auth para auteticacion
  final _auth = FirebaseAuth.instance;

  //Future<AuthResult> createUser({String email = "", String password = ""}) async {
  Future<AuthenticationRequest> createUser({String email = "", String password = ""}) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try{
      var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if( user != null )
        authRequest .success = true;
    }catch(e){
      _mapErrorMessage(authRequest, e.code);
    }
    return authRequest;
  }

  Future<FirebaseUser> getCurrentUser() async{
    try{
      return await _auth.currentUser();
    }catch(e){
      print(e);
    }
    return null;
  }

  //Future<AuthResult> loginUser({String email = "", String password = ""}) async {
  Future<AuthenticationRequest> loginUser({String email = "", String password = ""}) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try{
      var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(user != null)
        authRequest.success = true;
    }catch(e){
      _mapErrorMessage(authRequest, e.code);
    }
    return authRequest;
  }

  Future<void> singOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e);
    }
    return null;
  }

  void _mapErrorMessage(AuthenticationRequest authRequest, String  code){
    switch(code){
      case 'ERROR_USER_NOT_FOUND':
        authRequest.errorMessage = "Usuario no encontrado";
        break;

      case 'ERROR_WRONG_PASSWORD':
        authRequest.errorMessage = "Contraseña invalida";
        break;

      case 'ERROR_NETWORK_REQUEST_FAILED':
        authRequest.errorMessage = "Error en la conexión";
        break;

      case 'EMAIL_ALREADY_IN_USE':
        authRequest.errorMessage = "El usuario ya esta registrado";
        break;

      default:
        authRequest.errorMessage = code;
    }
  }

}