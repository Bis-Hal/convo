import 'package:flutter/material.dart';


class MessageContainer extends StatelessWidget {
  final String _message;
  final String uid;
  final String senderID;
  MessageContainer(this._message, this.uid, this.senderID );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: uid.toString() == senderID.toString() ? Alignment.topRight : Alignment.topLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
          color: senderID == uid ? Colors.greenAccent : Colors.red,
        ),

        margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        child: Text(_message),
    );
  }
}
