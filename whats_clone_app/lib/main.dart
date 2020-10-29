import 'package:flutter/material.dart';
import 'package:whatscloneapp/whatsapp_home.dart';
import  'package:camera/camera.dart';
import 'dart:async';

//hacemos una lista de camaras para poder usar las distintas camaras de un dispositivo
List<CameraDescription> cameras;

//future regresa un objeto parcial
Future<Null> main()  async{
  //arregla el pronlema de que se queda la pantalla en blanco cargando la aplicacion
  //sucede porque en el main tenemos un async y await
  WidgetsFlutterBinding.ensureInitialized();
  //mandamos a llamar con espera a las camaras habilitadas
  cameras = await availableCameras();
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "FlutterChat",
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,
      //enviamos un widget como parametro a nuestro constructor
      home: new WhatsAppHome(cameras),
    );
  }
}