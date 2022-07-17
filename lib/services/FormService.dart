import 'package:cloud_firestore/cloud_firestore.dart';

class FormService{

  final String uid;

  FormService({required this.uid});

  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection("data");

  Future setUser(dynamic age, dynamic scale) async{
    try{
      return await _collectionReference.doc(uid).set(
          {
            "UUID" : uid,
            "age" : age,
            "Scale" : scale,
          }
      );
    }
    catch(e){
      return null;
    }

  }
}