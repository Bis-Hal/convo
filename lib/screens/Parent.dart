import 'package:convo/screens/ChatRoom.dart';
import 'package:convo/screens/PeoplesList.dart';
import 'package:convo/screens/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Parent extends StatefulWidget {
  const Parent({Key? key}) : super(key: key);

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if(user!=null){
      return PeopleList();
    }
    else{
      return Register();
    }
  }
}
