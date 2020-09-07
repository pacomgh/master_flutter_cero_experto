import 'package:movieapp/common/MediaProvider.dart';
import 'package:movieapp/common/util.dart';
import 'package:movieapp/common/util.dart';

class Cast{
  int id;
  String name;
  String profilePath;
  //obtiene la imagen de tamaño medio de la foto del actor
  String getCastUrl() => getMediumPictureUrl(profilePath);

  factory Cast(Map jsonMap, MediaType mediaType){
    try{
      return new Cast.deserialize(jsonMap, mediaType);
    }catch (ex){
      throw ex;
    }
  }

  Cast.deserialize(Map jsonMap, MediaType mediaType):
      //pasamos de string a un entero
      id = (mediaType == MediaType.movie ? jsonMap["cast_id"] : jsonMap["id"]).toInt(),
      name = jsonMap["name"],
      profilePath = jsonMap["profile_path"] ?? "/eze9FO9VuryXLP0aF2cRqPCcibN.jpg";//??si es nulo

}