import 'dart:async';
import 'package:movieapp/model/Media.dart';
import 'package:movieapp/common/HttpHandler.dart';

abstract class MediaProvider{
  //recibimos el parametrp de a categoria
  Future<List<Media>> fetchMedia(String category);
}
//obtiene las peliculas
class MovieProvider extends MediaProvider{
  //variable para usar el httphandler
  HttpHandler _client = HttpHandler.get();
  @override
  //enviamos la categoria de pelicula que queremos ver
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchMovies(category: category);
  }
}
//obtiene los programas de television
class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchShow(category: category);
  }
}

//definimos enum para saber si va a ser una pelicula o una programa de tv
//ayuda para condicionar que bloque de codigo se ejecuta
enum MediaType{movie, show}