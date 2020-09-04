import 'package:flutter/material.dart';
import 'package:movieapp/common/MediaProvider.dart';
import 'package:movieapp/model/Media.dart';
import 'dart:ui' as ui;
import 'package:movieapp/cast_scroller.dart';

class MediaDetail extends StatelessWidget {
  final Media media;
  final MediaProvider provider;
  //recibimos el objeto media para obtener la imagen
  MediaDetail(this.media, this.provider);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //permite que otros widgets se sobrepongan
      body: new Stack(
        //como se situa en la pantalla
        fit: StackFit.expand,//la imagen se expande a to-do el espacio disponible
        children: <Widget>[
          //traemos una imagen desde el endpoint(IMDB en este caso)
          new Image.network(
            //obtenemos url referenciando a media
            media.getBackdropUrl(),
            //como se situa(cubre to-do el espacio con cover)
            fit: BoxFit.cover,
          ),
          //agrega filtro para desenfocar imagen de fondo
          new BackdropFilter(//desenfoque gausiano
            filter: new ui.ImageFilter.blur(
              sigmaX: 5.0, sigmaY: 5.0
            ),
            //para que no se vea completamente opaco
            child: new Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          //realizar scroll en el widget
          new SingleChildScrollView(
            child: new Container(//colocamos la imagen
              margin: const EdgeInsets.all(20),
              child: new Column(//para apilar de arriba a abajo
                children: <Widget>[
                  new Container(
                    alignment: Alignment.center,//centramos al centro
                    child: new Container(//definimos el tamaño del contenedor de la imagen
                      width: 390,
                      height: 390,
                   ),
                    decoration: new BoxDecoration(
                      //para el tipo de imagen
                      borderRadius: new BorderRadius.circular(10.0),
                      //para mostrar la imagen
                      image: new DecorationImage(
                          image: new NetworkImage(
                            media.getPosterUrl()
                          )
                      ),
                      //hacemos un sombreado con box shadow
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black,
                          //radio de difuminado
                          blurRadius: 20.0,
                            //desplazamiento
                          offset: new Offset(0.0, 10)
                        )
                      ]
                    ),
                  ),
                  //permite definir tamaño especifico para este widget
                  SizedBox(
                    height: 20.0,
                  ),
                  new Container(//lo usamos para definir el margen en las orillas
                    margin: const EdgeInsets.symmetric(vertical: 5.0,),
                    //ocupa todo el espacio habilitado en el box
                    child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                              media.title,
                              //el overflow lo escondemos
                              overflow: TextOverflow.fade,
                              //limita el texto a maximo solo una linea
                              maxLines: 1,
                              //definimos los estilos para el texto
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: 'Arvo'
                              ),
                            ),
                          ),
                          new Text(
                            //interpolacion para concatenar
                            '${media.voteAverage.toString()}/10',
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Arvo'
                            ),
                          )
                        ],
                    ),
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        media.overview,
                        //coloca ... si la descripcion es muy larga
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: 'Arvo'
                        ),
                      )
                    ],
                  ),
                  CastController(provider, media.id)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


