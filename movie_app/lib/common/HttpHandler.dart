import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHandler{
  //si no sabemos que devuelve usamos dynamic, dynamic = tipo generico
  Future<dynamic> getJson(Uri uri) async{
    http.Response respose = await http.get(uri);
    return json.decode.toString();
  }
}