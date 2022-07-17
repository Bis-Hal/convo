import 'package:convo/screens/ChatRoom.dart';
import 'package:convo/screens/Parent.dart';
import 'package:convo/screens/Register.dart';
import 'package:convo/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Scaffold(
          body: Parent(),
        ),
        routes: {
          '/ChatRoom' : (context) => ChatRoom(),
        },
      ),
    );
  }
}