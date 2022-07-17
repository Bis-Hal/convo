import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convo/models/Message.dart';

class TextingService{

  final String uid;


  TextingService(this.uid);

  CollectionReference _textingCollection = FirebaseFirestore.instance.collection("message");

  Future send(Message message) async {
    try {
      return await _textingCollection.doc().set({
        "ReceiverID": message.receiverId,
        "SenderID": message.senderId,
        "Message": message.message,
        "Time": message.time
      });
    } catch (e) {
      e.toString();
      return null;
    }
  }

  List<Message> msgByID(QuerySnapshot querySnapshot){
    return  querySnapshot.docs.map((e) => Message(senderId: e['SenderID'], receiverId: e['ReceiverID'], message: e['Message'],time: DateTime.now())).toList();

  }

  Stream<List<Message>> get message{
    return _textingCollection
        .snapshots()
        .map(msgByID);
  }
}