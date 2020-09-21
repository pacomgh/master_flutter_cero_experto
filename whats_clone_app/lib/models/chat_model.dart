class ChatModel {
  final String name;
  String message;
  final String time;
  final String imageUrl;

  //inicializamos las variables de clase en nuestro constructor
  ChatModel({this.name, this.message, this.time, this.imageUrl});
}
//para poblar los datos de la aplicacion
  List<ChatModel> messageData = [
    new ChatModel(
        name: "Paco",
        message: "Hola",
        time: "4:15",
        imageUrl: "https://www.facebook.com/photo?fbid=3031612030241301&set=a.113284175407449"
    ), //agregar mas modelos
  ];