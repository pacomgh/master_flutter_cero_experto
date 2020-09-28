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
        imageUrl: "https://pbs.twimg.com/profile_images/1005118754353795072/z8QUzZKx_400x400.jpg"
    ),
    new ChatModel(
        name: "Manuel",
        message: "Hola",
        time: "4:15",
        imageUrl: "https://pbs.twimg.com/profile_images/1005118754353795072/z8QUzZKx_400x400.jpg"
    ),
    new ChatModel(
        name: "Alejando",
        message: "Hola",
        time: "4:15",
        imageUrl: "https://pbs.twimg.com/profile_images/1005118754353795072/z8QUzZKx_400x400.jpg"
    ),
    new ChatModel(
        name: "Fernando",
        message: "Hola",
        time: "4:15",
        imageUrl: "https://pbs.twimg.com/profile_images/1005118754353795072/z8QUzZKx_400x400.jpg"
    ),//agregar mas modelos
  ];