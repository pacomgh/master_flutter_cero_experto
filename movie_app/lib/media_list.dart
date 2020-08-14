import 'package:flutter/material.dart';
import 'package:movieapp/common/HttpHandler.dart';
import 'package:movieapp/media_list_item.dart';
import 'package:movieapp/model/Media.dart';


class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        //cantidad de elementos que tiene
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index){
          return new MediaListItem(_media[index]);
        }
      ),
    );
  }

  //obtenemos las peliculas
  void loadMovies() async{
    //guardamos la respuesta en una variable
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });

  }
}
