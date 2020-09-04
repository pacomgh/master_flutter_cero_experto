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
    return Container();
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
}
