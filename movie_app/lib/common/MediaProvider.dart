import 'dart:async';
import 'package:movieapp/model/Media.dart';
import 'package.movieapp/common/HttpHandler.dart'

abstract class MediaProvider{
  Future<List<Media>> fetchMedia();
}

class MovieProvider extends MediaProvider{
  //variable para usar el httphandler
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(){
    return _client = HttpHandler.get();
  }
}

class ShowProvider extends MediaProvider{
  @override
  Future<List<Media>> fetchMedia();
}