import 'package:flutter/material.dart';
import 'package:movieapp/model/Media.dart';
import 'dart:ui' as ui;

class MediaDetail extends StatelessWidget {
  final Media media;
  //recibimos el objeto media para obtener la imagen
  MediaDetail(this.media);

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
          )
        ],
      ),
    );
  }
}


