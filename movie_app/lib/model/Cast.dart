import 'package:movieapp/common/MediaProvider.dart';
import 'package:movieapp/common/util.dart';
import 'package:movieapp/common/util.dart';

class Cast{
  int id;
  String name;
  String profilePath;
  int mediaId;//lo usamos para trabajar con el flujo de obtencion de datos de la bd

  //obtiene la imagen de tamaño medio de la foto del actor
  String getCastUrl() => getMediumPictureUrl(profilePath);

  factory Cast(Map jsonMap, MediaType mediaType, int mediaId){
    try{
      return new Cast.deserialize(jsonMap, mediaType, mediaId);
    }catch (ex){
      throw ex;
    }
  }

  Cast.deserialize(Map jsonMap, MediaType mediaType, int mediaId):
      //pasamos de string a un entero
      id = jsonMap["id"].toInt(),//no usamos el cast_id usamos el otro id que viene en el json
      name = jsonMap["name"],
      profilePath = jsonMap["profile_path"] ?? "/eze9FO9VuryXLP0aF2cRqPCcibN.jpg",//??si es nulo
      mediaId = mediaId;

  //convertimos cada dato a un jsonmap
  Cast.fromDb(Map<String, dynamic> parsedJson):
      //llamamos el did de la base de datos
        id = parsedJson["id"].toInt(),
      //obtenemos el nombre de la base de datos
        name = parsedJson["name"],
      //obtenemos el profile path de la base de datos
        profilePath = parsedJson["profile_path"],
        mediaId = parsedJson["media_Id"].toInt();

  //Tansformamos el objeto y lo llevamos al formato de la bd
  //devuelve el formato de la bd, <string(llave), dynamic(valor)
  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "id":id,
      "name": name,
      "media_Id": mediaId.toInt(),
      "profile_path": profilePath
    };
  }

}