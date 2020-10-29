import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Camera extends StatefulWidget {
  //creamos una variable para usar las camaras
  final List<CameraDescription> cameras;
  //enviamos a camaras la variable de las camaras
  Camera(this.cameras);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  //llamamos al cohntrolador de las camaras
  CameraController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //instanciamops cl controlador de la camara
    //enviamos como parametro la camara que queemos utilizar y la resolucion
    controller = new CameraController(widget.cameras[0], ResolutionPreset.medium);
    //inicializamos nuestro objeto
    controller.initialize().then((_) {
      //verificamos que la camara este montada en la jerarquia de objetos del framework
      if (!mounted) //usamos la variable mouted para hacer la verificacion
        return;
      //si esta montado el objeto reconstruimos el widget en el setstate
      setState(() {

      });
    });
  }

  //liberamos objetos dentro del arbol jerarquico
  @override
  void dispose(){
    controller?.dispose();
    //eliminan todos los objetos
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //verificamos que el objeto este inicializado
    if(!controller.value.isInitialized)
      //si no esta inicializado creamos un container vacio
      return Container();
    return new AspectRatio(
      //regresa un widget relacionado con el ratio del dispositivo, se acomoda
      //la camara al widget
      aspectRatio: controller.value.aspectRatio,
      //llamamos a este widget que nos da un preview de la camara
      child: new CameraPreview(controller),
    );
  }
}

