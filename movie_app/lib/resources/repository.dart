import 'package:movieapp/common/MediaProvider.dart';
import 'package:movieapp/model/Cast.dart';
import 'package:movieapp/resources/api_provider.dart';
import 'package:movieapp/resources/db_provider.dart';
import 'package:movieapp/resources/resource_provider.dart';

//se encarga de determinar lo que vamos a llamar, obtener registros de db o api
class Repository{
  static final Repository _repository = new Repository();
  //no podemos usar los metodos get porque es estatico y no podemos colocar un estatico
  //como parte de la implementacion de una interfaz
  //ApiProvider _apiProvider = ApiProvider.get();
  //DBProvider _dbProvider = DBProvider.get();
  //hacemos la referencia a la interfaz reosurce provider y colocamos en una lista
  List<ResourceProvider> _providers = <ResourceProvider>[
    dbProvider,
    apiProvider
  ];

  List<CacheProvider> caches = <CacheProvider>[
    dbProvider
  ];


  //añadimos un metodo get para que se pueda acceder desde afuera a esta clase
  static Repository get(){
    return _repository;
  }

  //para obtener los actores de las películas
  //es async porque accedemos a los datos de la bd y la api
  Future<List<Cast>> fetchCasts(int mediaId, MediaType mediaType) async{
    var provider;
    //recibira los datos de la base de datos como del api
    List<Cast> list;

    //recorremos todos los provider
    for(provider in _providers) {
      list = await provider.fetchCasts(mediaId, mediaType);
      if (list != null)
        break;
    }

    //insertamos los registros
    for(var cache in caches){
      //cuando es dstinto del api provider los insertamos en la bd
      if(cache != provider){
        list.forEach((element) => cache.addCast(element));//insertamos registros
      }
    }

    return list;
    /*List<Cast> list = await _dbProvider.fetchCasts(mediaId);
    if(list != null)
      return list;
    //si no pasa, vamos al api de tmdb en base al mediaId
    list = await _apiProvider.fetchCreditMovies(mediaId);
    //cuando obtenemos esos valores los guardamos en la BD para no ir a la api otra vez
    //recorremos cada elemento de la lista y lo agregamos a la bd cada elemento
    list.forEach((element) => _dbProvider.addCast(element));

    return list;*/
  }
}