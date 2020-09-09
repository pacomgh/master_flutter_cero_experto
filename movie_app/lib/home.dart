import 'package:flutter/material.dart';
import 'package:movieapp/media_list.dart';
import 'file:///E:/AndroidStudioProjects/flutter/master_flutter_cero_experto/movie_app/lib/resources/api_provider.dart';
import 'package:movieapp/common/MediaProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variables para alojar la instancia de clase que queremos mostrar de la lista
  final MediaProvider movieProvider = new MovieProvider();
  final MediaProvider showProvider = new ShowProvider();
  //variable que controla que pagina se vera en pageview
  PageController _pageController;
  int _page = 0;
  //variable para el tipo que estamos utilizando con el enum
  MediaType mediaType = MediaType.movie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_loadJson();
    _pageController = new PageController();
  }

  @override
  //liberamos page controller del arbol jerarquico
  void dispose(){
    _pageController.dispose();
  }

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
        children: _getMediaList(),
        //determinamos que pagina estara visible en el pageview
        controller: _pageController,
        //nos da el indice de la pagina que se le hace click
        onPageChanged: (int index){
          setState(() {
            //nos matiene en la pagina que estamos
            _page = index;
          });
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
          items: _getFooterItems(),
          //creamos una animacion para cuando cambie
          onTap: _navigationTapped,
        //
        currentIndex: _page,
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems(){
    return mediaType == MediaType.movie ?
    [
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
    ] : [
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
          title: Text("Al aire")
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
  //devuelve lista de widget
  //media type cambia con el menu que se selecciona
  List<Widget> _getMediaList(){
    //devuelve widget dependiendo del mediatype que se envia(enum)
    return mediaType == MediaType.movie ? <Widget>[
      //obtenemos el proveedor de peliculas
      new MediaList(movieProvider, "popular"),
      new MediaList(movieProvider, "upcoming"),
      new MediaList(movieProvider, "top_rated")
    ]:
    <Widget>[
      //obtenemos el proveedor de show de tv
      new MediaList(showProvider, "popular"),
      new MediaList(showProvider, "on_the_air"),
      new MediaList(showProvider, "top_rated"),
    ];
  }

  //recibimos el parametro del numero de pagina que seleccionamos
  void _navigationTapped(int page){
    //creamos una animacion para el cambio de pagina
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 3),
      curve: Curves.ease
    );
  }

  void _getController(){}

  /*_loadJson()async{
    String data = await HttpHandler().tetchMovies();
    print(data);
  }*/
}

