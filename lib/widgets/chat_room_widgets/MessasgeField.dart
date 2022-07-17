import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Message.dart';
import '../../services/TextingService.dart';

class MessageField extends StatefulWidget {
  const MessageField({Key? key}) : super(key: key);

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: TextField(
        controller: _text,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: 'message',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent,width: 1.0,style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey,width: 1.0,style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              User user = Provider.of<User>(context, listen: false);
              await TextingService('').send(Message(senderId: user.uid , receiverId: "abc", message: _text.text,time: DateTime.now()));
              _text.clear();
            },
          ),
        ),
      ),
    );
  }
}
