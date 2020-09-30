//clase del modelo de la pagina de estatus
//import 'package:whatscloneapp/pages/status_screen.dart';
import 'package:whatscloneapp/models/chat_model.dart';

class StatusModel{
  final String imgUrl;
  final String name;
  final String time;

  StatusModel({this.name, this.imgUrl, this.time});
}

//creamos la lista
List<StatusModel> status = [
  new StatusModel(
    name: messageData[0].name,
    time: "Hoy, 03:14AM",
    imgUrl: messageData[0].imageUrl
  ),
  new StatusModel(
      name: messageData[0].name,
      time: "Hoy, 03:14AM",
      imgUrl: messageData[0].imageUrl
  ),new StatusModel(
      name: messageData[0].name,
      time: "Hoy, 03:14AM",
      imgUrl: messageData[0].imageUrl
  ),new StatusModel(
      name: messageData[0].name,
      time: "Hoy, 03:14AM",
      imgUrl: messageData[0].imageUrl
  )
];