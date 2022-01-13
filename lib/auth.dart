import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';


abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  String currentUserEmail();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {

    //User user = (await _firebaseAuth.signInWithEmailAndPassword(
    //    email: email, password: password))
    //    .user;
    //return user.uid;
    return '3';
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    //User user = (await _firebaseAuth.createUserWithEmailAndPassword(
    //    email: email, password: password))
    //    .user;
    //return user.uid;
    return '3';
  }

  Future<String> currentUser() async {
    //User user = _firebaseAuth.currentUser;
    //return user.uid;
    return '3';
  }

  String currentUserEmail() {
    //User user = _firebaseAuth.currentUser;
    //return user.email;
    return '3';
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}