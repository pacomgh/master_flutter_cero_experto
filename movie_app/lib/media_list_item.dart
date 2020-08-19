import 'package:flutter/material.dart';
import 'package:movieapp/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;

  MediaListItem(this.media);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
            //permite apilar elementos dentro del un widget
            child: Stack(
              children: [
                new FadeInImage.assetNetwork(
                  placeholder: "assets/placeholder.jpg",
                  image: media.getBackdropUrl(),
                  //como se desplega la imagen dentro del box donde esta situado
                  fit: BoxFit.cover,
                  //infinito para que ocupe to-do el espacio
                  width: double.infinity,
                  height: 200,
                  //duracion de la animacion hasta que aparezca
                  fadeInDuration: new Duration(milliseconds: 40),
                ),
                //permite posicionar un elemento dentro de otro
                new Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: new Container(
                    decoration: new BoxDecoration(
                      //[], opacidad
                      color: Colors.grey[900].withOpacity(.5),
                    ),
                    //para que ocupe el espacio indicado
                    constraints: new BoxConstraints.expand(
                      height: 55.0
                    ),
                  )
                ),
                new Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Container(
                        child: new Text(
                            media.title, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                      new Container(
                        width: 250.0,
                        padding: const EdgeInsets.only(top: 4),
                        child: new Text(
                          media.getGenres(),
                          style: new TextStyle(color: Colors.white,),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                new Positioned(
                  right: 5.0,
                  bottom: 10.0,
                  child: new Column(
                    children: [
                      new Row(
                        children: [
                          new Text(media.voteAverage.toString()),
                          new Container(width: 4.0,),
                          new Icon(Icons.star, color: Colors.white, size: 16.0,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
