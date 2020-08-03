import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {

  Firestore _firestore = Firestore.instance;

  void save({String collectionName, Map<String, dynamic> collectionValues}) {
    _firestore.collection(collectionName).add(collectionValues);
  }

  Future<QuerySnapshot> getMessages() async{
    return await _firestore.collection("messages").getDocuments();
  }

  Stream<QuerySnapshot> getMessageStream() {
    //con snapshots se hace solo llama una vez y tenemos disponible la informacion
    return  _firestore.collection("messages").snapshots();
  }
}