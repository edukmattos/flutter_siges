import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AuthRepository extends Disposable {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  final HasuraConnect _hasuraConnect;
  AuthRepository(this._hasuraConnect);

  Future<bool> signUpHasura(String email) async {
    var insert = '''
      userAdd (\$email:String!, \$user_type_id:Int!, \$role_id:Int!, \$user_status_id:Int!) {
        insert_users (objects: {email: \$email, user_type_id: \$user_type_id, role_id: \$role_id, user_status_id: \$user_status_id }) { 
          affected_rows 
        }
      }
    ''';

    print("signUpHasura email : $email");

    var snapshot = await _hasuraConnect.mutation(insert, variables: {
      "email": email,
      "user_type_id": 1,
      "role_id": 1,
      "user_status_id": 1,
    });

    return snapshot["data"]["insert_users"]["affected_rows"] > 0;

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
