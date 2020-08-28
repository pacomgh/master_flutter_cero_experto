import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movieapp/common/Constants.dart';
import 'package:movieapp/model/Media.dart';
import 'package:movieapp/common/MediaProvider.dart';

class HttpHandler{
  //variable para poder usar http handler desde otra clase
  static final _httpHandler = new HttpHandler();
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-ES";
  //metodo que retorna el objeto de httphandler
  static HttpHandler get(){
    return _httpHandler;
  }
  //si no sabemos que devuelve usamos dynamic, dynamic = tipo generico
  //obtenemos el json de la respeusta a la api
  //interaccion mediante llamadas asyncronas, usamos future
  Future<dynamic> getJson(Uri uri) async{
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }
  //obtenemos las peliculas populares
  //future se usa para trabajar de forma asincrona
  Future<List<Media>> fetchMovies({String category:"populares"}) async{
    //usasmos uri.http para obtener los datos de la url del api
    //primer parametro url api, segundo endpoint de la consulta a la api
    //tercer parametro objeto para enviar los parametros necesarios
    var uri = new Uri.http(_baseUrl, "3/movie/$category",{//define el url
      //api generada
      'api_key': api_key,
      //pagina
      'page': '1',
      'language': _language
    });

    //usamos the cuando obtenemos el objeto completo
    //obtenemos la data de la api y mapeamos hacia el modelo Media
    return getJson(uri).then((data) =>
        data['results'].map<Media>((item) => new Media(item, MediaType.movie)).toList()
    );
  }
  //llama a los programas de television
  //{tipo nombre:"valor por default"(depende del tipo)}
  Future<List<Media>> fetchShow({String category:"populares"}) async{
    //obtenemos la categoria de los shows de tv
    var uri = new Uri.http(_baseUrl, "3/tv/$category",{//define el url
      //api generada
      'api_key': api_key,
      //pagina
      'page': '1',
      'language': _language
    });
    return getJson(uri).then((data) =>
        data['results'].map<Media>((item) => new Media(item, MediaType.show)).toList()
    );
  }

  //
  /*Future<String> tetchMovies(){
    //usasmos uri.http para obtener los datos de la url del api
    //primer parametro url api, segundo endpoint de la consulta a la api
    //tercer parametro objeto para enviar los parametros necesarios
    var uri = new Uri.http(_baseUrl, "3/movie/popular",{//define el url
      //api generada
      'api_key': api_key,
      //pagina
      'page': '1',
      'language': _language
    });

    //usamos the cuando obtenemos el objeto completo
    return getJson(uri).then((data) => data.toString());
  }*/
}