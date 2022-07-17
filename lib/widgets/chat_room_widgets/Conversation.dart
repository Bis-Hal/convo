import 'package:convo/services/TextingService.dart';
import 'package:convo/widgets/chat_room_widgets/MessageContainer.dart';
import 'package:convo/widgets/chat_room_widgets/MessasgeField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Message.dart';

class Conversation extends StatefulWidget {
  const Conversation({Key? key}) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                 StreamBuilder<List<Message>>(
                    stream: TextingService(user.uid).message,
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        List<Message> listMsg = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                            itemBuilder: (context, index){
                              return MessageContainer(listMsg[index].message,user.uid,listMsg[index].senderId);
                            }
                        );
                       // return Container();
                      }
                      else{
                        return Container();
                      }
                    }
                  )
              ],
            ),
          ),
          MessageField(),

        ]
    );
  }
}
