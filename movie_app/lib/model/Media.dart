import 'package:movieapp/common/util.dart';
class Media{
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  //obtenemos la url de una imagen mediana mandando el url que obtuvimos del api
  String getPosterutl() => getMediumPictureUrl(posterPath);

  factory Media(Map jsonMap){
    try{
      return new Media.deserialize(jsonMap);
    }catch(ex){
      throw ex;
    }
  }

  //tomamos el json y lo transformamos a string con deserialize
  Media.deserialize(Map json):
      id = json["id"].toInt(),
      voteAverage = json["vote_average"].toDouble(),
      title = json["title"],
      posterPath = json["poster_path"] ?? "",
      backdropPath = json["backdrop_path"] ?? "",
      overview = json["overview"],
      releaseDate = json["release_date"],
      genreIds = json["genre_ids"].toList();
}