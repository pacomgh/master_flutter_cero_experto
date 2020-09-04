import 'dart:async';
import 'package:movieapp/model/Media.dart';
import 'package:movieapp/common/HttpHandler.dart';
import 'package:movieapp/model/Cast.dart';

abstract class MediaProvider{
  //recibimos el parametrp de a categoria
  Future<List<Media>> fetchMedia(String category);
  //future representa un objeto parcial
  Future<List<Cast>> fetchCast(int mediaId);
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

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditMovies(mediaId);
  }
  
}
//obtiene los programas de television
class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchShow(category: category);
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditShow(mediaId);
  }
}

//definimos enum para saber si va a ser una pelicula o una programa de tv
//ayuda para condicionar que bloque de codigo se ejecuta
enum MediaType{movie, show}