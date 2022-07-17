import 'package:convo/services/AuthService.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  dynamic result = await _authService.register();
                  if(result!=null){
                    print(result);
                  }
                  else{
                    print("Failed");
                  }
                },
                child: Text("Register"),
              ),
              ElevatedButton(
                onPressed: () async {
                  dynamic result = await _authService.signIn("bishalmaharjan17@gmail.com", "helloworld");
                  if(result!=null){
                    print(result);
                  }
                  else{
                    print("Failed");
                  }
                },
                child: Text("Sigin"),
              ),
              ElevatedButton(
                onPressed: () async {
                  dynamic result = await _authService.signUp("bishalmaharjan17@gmail.com", "helloworld");
                  if(result!=null){
                    print(result);
                  }
                  else{
                    print("Failed");
                  }
                },
                child: Text("SigUp"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
