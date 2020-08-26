import 'package:flutter/material.dart';
import 'package:movieapp/media_list.dart';
import 'package:movieapp/common/HttpHandler.dart';
import 'package:movieapp/common/MediaProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variables para alojar la instancia de clase que queremos mostrar de la lista
  final MediaProvider movieProvider = new MovieProvider();
  final MediaProvider showProvider = new ShowProvider();
  //variable para el tipo que estamos utilizando con el enum
  MediaType mediaType = MediaType.movie;

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _loadJson();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Movie app"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: (){} ,
          )
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: new Text(
                'Movie Perfil',
                style: new TextStyle(
                    color: Colors.white),
              ),
            ),
            new ListTile(
              trailing: new Icon(Icons.local_movies, color: Colors.white,),
              title: new Text("Películas"),
              selected: mediaType == MediaType.movie,
              onTap: (){
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              height: 5.0,
            ),
            new ListTile(
              trailing: new Icon(Icons.live_tv, color: Colors.white,),
              title: new Text("Televisión"),
              selected: mediaType == MediaType.show,
              onTap: (){
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              height: 5.0,
            ),
            new ListTile(
              trailing: new Icon(Icons.close, color: Colors.white,),
              title: new Text("Cerrar"),
              //permite cerrar las rutas dentro de la aplicacion
              onTap: () => Navigator.of(context).pop(),
            ),
            new Divider(
              height: 5.0,
            ),
          ],
        ),
      ),
      body: new PageView(
        children: <Widget>[
          new MediaList()
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
          items: _getFooterItems()
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems(){
    return [
      new BottomNavigationBarItem(
          icon: new Icon(
              Icons.thumb_up
          ),
          title: Text("Populares")
      ),
      new BottomNavigationBarItem(
          icon: new Icon(
              Icons.update
          ),
          title: Text("Proximamente")
      ),
      new BottomNavigationBarItem(
          icon: new Icon(
              Icons.star
          ),
          title: Text("Mejor Valoradas")
      )
    ];
  }

  void _changeMediaType(MediaType type){
    if(mediaType != type)
      //hacemos un rebuild de nuestro widget
      setState(() {
        mediaType = type;
      });
  }

  /*_loadJson()async{
    String data = await HttpHandler().tetchMovies();
    print(data);
  }*/
}

