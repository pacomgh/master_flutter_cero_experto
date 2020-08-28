import 'package:flutter/material.dart';
import 'package:movieapp/common/HttpHandler.dart';
import 'package:movieapp/model/Media.dart';
import 'package:movieapp/media_list_item.dart';
import 'package:movieapp/common/MediaProvider.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  String category;
  MediaList(this.provider, this.category);

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
  //llamamos este metodo cuando queremos hacer recargar la informacion cada
  //que se hace un cambio
  @override
  void didUpdateWidget(MediaList oldWidget){
    //solo queremos que se recargue en caso de que el provider cambie por el usuario
    //runtimetype es el tupo de objeto que tenemos en tiempo de ejecucion show/media prov
    if(oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      _media = new List();
      loadMovies();
    }
    super.didUpdateWidget(oldWidget);
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
    //fetch media viene con movie o show provider
    //enviamos la categoria que queremos ver
    var media = await widget.provider.fetchMedia(widget.category);
    setState(() {
      _media.addAll(media);
    });

  }
}
