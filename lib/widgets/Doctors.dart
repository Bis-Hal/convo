import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.0,
      height: 65.0,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(50.0),
          color: Colors.white
      ),
    );
  }
}
