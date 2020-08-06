import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
            ),
            new Divider(
              height: 5.0,
            ),
            new ListTile(
              trailing: new Icon(Icons.live_tv, color: Colors.white,),
              title: new Text("Televisión"),
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
      body: new PageView(),
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
}
