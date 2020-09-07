import 'package:flutter/material.dart';
import 'package:movieapp/common/MediaProvider.dart';
import 'package:movieapp/model/Cast.dart';


class CastController extends StatefulWidget {
  final MediaProvider provider;
  final int mediaId;

  CastController(this.provider, this.mediaId);
  @override
  _CastControllerState createState() => _CastControllerState();
}

class _CastControllerState extends State<CastController> {
  //se carga en el init state para en el momento que se cargue en el widget, es
  //un metodo asincrono -> initstate
  @override
  void initState() {
    super.initState();
    //cada que cargamos el widget se llama a este metodo
    loadCasts();
  }

  final List<Cast> _casts = new List<Cast>();
  //constructor que recibimos del widget principal
  @override
  Widget build(BuildContext context) {
    //para las fotograias
    return Column(
      children: [
        //este widget es para dar un tamaño depediendo de la cantidad de datos
        //recibido en la coleccion
        SizedBox.fromSize(
          //desde donde inicia el tamaño del widget
          size: const Size.fromHeight(180.0),
          //colocamos el widget que representa la imagen
          child: ListView.builder(
            itemCount: _casts.length,//cantidad de elementos del objeto cast
            //el tipo de scroll que queremos hacer
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: _builderCast,
          ),
        )
      ],
    );
  }

  //si devuelve un future debe ser un metodo async
  //este metodo llama al fetch cast
  void loadCasts()async{
    //con el provider sabemos si llamamos al show o movie
    var results = await widget.provider.fetchCast(widget.mediaId);
    //para utilizar cuando dibujemos el widget lo colocamos en setstare
    setState(() {
      _casts.addAll(results);
    });
  }

  Widget _builderCast(BuildContext ctx, int index){
    //se obtiene de la  de cast en base al indice de la lista
    var cast = _casts[index];
    //retorna el widget que representa la imagen y el titulo de imagen
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      //child de tipo column para organizar los elementos que contiene
      child: Column(
        children: [
          //da forma de circulo a las imagenes
          CircleAvatar(
            //para insertar la imagen
            backgroundImage: new NetworkImage(
              cast.getCastUrl()
            ),
            //aumentamos el tamaño del radio de la imagen
            radius: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(cast.name),
          ),
        ],
      ),
    );
  }


}
