import 'package:movieapp/model/Cast.dart';
import 'package:movieapp/resources/api_provider.dart';
import 'package:movieapp/resources/db_provider.dart';

//se encarga de determinar lo que vamos a llamar, obtener registros de db o api
class Repository{
  ApiProvider _apiProvider = ApiProvider.get();
  DBProvider _dbProvider = DBProvider.get();
  static final Repository _repository = new Repository();

  //añadimos un metodo get para que se pueda acceder desde afuera a esta clase
  static Repository get(){
    return _repository;
  }

  //para obtener los actores de las películas
  //es async porque accedemos a los datos de la bd y la api
  Future<List<Cast>> fetchCastMovies(int mediaId) async{
    List<Cast> list = await _dbProvider.fetchCasts(mediaId);
    if(list != null)
      return list;
    //si no pasa, vamos al api de tmdb en base al mediaId
    list = await _apiProvider.fetchCreditMovies(mediaId);
    //cuando obtenemos esos valores los guardamos en la BD para no ir a la api otra vez
    //recorremos cada elemento de la lista y lo agregamos a la bd cada elemento
    list.forEach((element) => _dbProvider.addCast(element));

    return list;
  }

  //obtiene los datos de los shows
  Future<List<Cast>> fetchCastShows(int mediaId) async{
    List<Cast> list = await _dbProvider.fetchCasts(mediaId);
    if(list != null)
      return list;
    //si no pasa, vamos al api de tmdb en base al mediaId
    list = await _apiProvider.fetchCreditShow(mediaId);
    //cuando obtenemos esos valores los guardamos en la BD para no ir a la api otra vez
    //recorremos cada elemento de la lista y lo agregamos a la bd cada elemento
    list.forEach((element) => _dbProvider.addCast(element));

    return list;
  }
}