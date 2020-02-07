import 'package:flutter_modular/flutter_modular.dart';

@immutable
class UserRepository extends Disposable {

  UserRepository({Auth firebaseAuth, GoogleAuthProvider googleSignin})
      : _firebaseAuth = firebaseAuth ?? auth(),
        _googleSignIn = googleSignin ?? GoogleAuthProvider();

  final Auth _firebaseAuth;
  final GoogleAuthProvider _googleSignIn;

  Future<UserCredential> signInWithGoogle() async {
    try {
      return await _firebaseAuth.signInWithPopup(_googleSignIn);
    } catch (e) {
      print('Error in sign in with google: $e');
      throw '$e';
    }
  }

  Future<UserCredential> signInWithCredentials(
      String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(email, password);
    } catch (e) {
      print('Error in sign in with credentials: $e');
      // return e;
      throw '$e';
    }
  }

  Future<UserCredential> signUp({String email, String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email,
        password,
      );
    } catch (e) {
      print('Error siging in with credentials: $e');
      throw '$e';
      // throw Error('Error signing up with credentials: $e');
      // return e;
    }
  }

  Future<dynamic> signOut() async {
    try {
      return Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } catch (e) {
      print ('EFuture fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (_firebaseAuth.currentUser).email;
  }

  //dispose will be called automatically
  @override
  void dispose() {
    
  }

}
  