import 'package:movieapp/common/MediaProvider.dart';

class Cast{
  int id;
  String name;
  String profilePath;

  factory Cast(Map jsonMap, MediaType mediaType){
    try{
      return new Cast.deserialize(jsonMap, mediaType);
    }catch (ex){
      throw ex;
    }
  }

  Cast.deserialize(Map jsonMap, MediaType mediaType):
      //pasamos de string a un entero
      id = jsonMap["cast_id"].toInt(),
      name = jsonMap["name"],
      profilePath = jsonMap["profile_path"];

}