import 'dart:async';
import 'package:movieapp/model/Cast.dart';
import 'package:movieapp/model/Media.dart';
import 'package:movieapp/resources/api_provider.dart';
import 'package:movieapp/resources/repository.dart';

abstract class MediaProvider{
  //acceso a repository
  Repository _repository = Repository.get();
  //recibimos el parametrp de a categoria
  Future<List<Media>> fetchMedia(String category);
  //future representa un objeto parcial
  Future<List<Cast>> fetchCast(int mediaId);
}
//obtiene las peliculas
class MovieProvider extends MediaProvider{
  //variable para usar el httphandler
  ApiProvider _client = ApiProvider.get();
  @override
  //enviamos la categoria de pelicula que queremos ver
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchMovies(category: category);
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _repository.fetchCastMovies(mediaId);
  }
  
}
//obtiene los programas de television
class ShowProvider extends MediaProvider{
  ApiProvider _client = ApiProvider.get();
  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchShow(category: category);
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _repository.fetchCastShows(mediaId);
  }
}

//definimos enum para saber si va a ser una pelicula o una programa de tv
//ayuda para condicionar que bloque de codigo se ejecuta
enum MediaType{movie, show}