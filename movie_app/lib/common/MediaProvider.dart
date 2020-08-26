import 'dart:async';
import 'package:movieapp/model/Media.dart';
import 'package:movieapp/common/HttpHandler.dart';

abstract class MediaProvider{
  Future<List<Media>> fetchMedia();
}
//obtiene las peliculas
class MovieProvider extends MediaProvider{
  //variable para usar el httphandler
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(){
    return _client.fetchMovies();
  }
}
//obtiene los programas de television
class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(){
    return _client.fetchShow();
  }
}

//definimos enum para saber si va a ser una pelicula o una programa de tv
//ayuda para condicionar que bloque de codigo se ejecuta
enum MediaType{movie, show}