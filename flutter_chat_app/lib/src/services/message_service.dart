import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {

  Firestore _firestore = Firestore.instance;

  void save({String collectionName, Map<String, dynamic> collectionValues}) {
    _firestore.collection(collectionName).add(collectionValues);
  }
}