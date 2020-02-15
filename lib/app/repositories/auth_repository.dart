import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository extends Disposable {

  String _errorMsg; 
  bool valid = true;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<dynamic> signIn(String email, String password) async { 
    
    try {
      AuthResult result = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
      ));
      
      var user = result.user;

      var tokenId = await user.getIdToken();

      var valid = tokenId != null;

      print("valid: $valid");

      return valid;
      
    } catch (e) {

      valid = false;

      print("valid: $valid");

      print(e.code);

      switch (e.code) {
        case 'auth/wrong-password':
          _errorMsg = 'Ops... Senha incorreta !';
          print(_errorMsg);
          break;
        
        case 'auth/user-not-found':
          _errorMsg = 'Ops... E-mail inexistente !';
          print(_errorMsg);
          break;

        case 'auth/user-disabled':
          _errorMsg = 'Ops... Conta Desabilitada !';
          print(_errorMsg);
          break;
          
        default:
      }
    }
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
 
  //dispose will be called automatically
  @override
  void dispose() {}
}
