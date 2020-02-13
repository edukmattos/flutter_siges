import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository extends Disposable {

  final SharedPreferences sharedPreferences;
  AuthRepository(this.sharedPreferences);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<dynamic> signIn(String email, String password) async { 
    print(email);
    try {
      final FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
      )).user;

        var tokenId = await user.getIdToken();

        var valid = tokenId != null;

        if(valid) {
          sharedPreferences.setString("token", tokenId.token);
        }

        return true;

      } catch (e) {
      print(e);

      return false;
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
