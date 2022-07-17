import 'package:firebase_auth/firebase_auth.dart';
class AuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signOut() async{
    return await _auth.signOut();
  }

  Future register() async{
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }catch(e){
      return null;
    }
  }

  Future signIn(String email, String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    }catch(e){
      return null;
    }
  }


  Future signUp(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    }catch(e){
      return null;
    }
  }

  Stream<User?> get user{
    return _auth.authStateChanges();
  }

}