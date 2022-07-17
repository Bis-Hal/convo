import 'package:convo/widgets/Doctors.dart';
import 'package:flutter/material.dart';

import '../services/AuthService.dart';

class PeopleList extends StatefulWidget {
  const PeopleList({Key? key}) : super(key: key);

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  TextEditingController _search = TextEditingController();
   final id = [1,2,3,4,5,6,7,8,9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        actions: [
          IconButton(onPressed: (){
              AuthService().signOut();
            },
            icon:Padding(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 5.0),
               child: Icon(Icons.logout, ),
            ),
          ),
        ],
      ),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Colors.blueGrey, Colors.white]
          )
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child:Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        label: Text('Search'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          gapPadding: 10.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.yellow,width: 1.0, style: BorderStyle.solid),
                        ),

                        suffixIcon:IconButton(
                          icon: Icon(Icons.search),
                          onPressed: (){

                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child:GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/ChatRoom');
                },
               child: SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     ...id.map((e) => Doctors()),
                   ],
                 ),
               )
              ),
            ),

          ],
        ),
      )
      );
  }
}
