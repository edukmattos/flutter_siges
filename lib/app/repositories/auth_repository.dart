import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../models/auth_model.dart';

class AuthRepository extends Disposable {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  final HasuraConnect _hasuraConnect;
  AuthRepository(this._hasuraConnect);

  Future<bool> signUpHasura(String email) async {
    var insert = '''
      mutation 
        userAdd(
          \$email: String
        ) {
            user_insert
              (
                objects: 
                  {
                    email: $email 
                  } 
              ) 
              { 
                affected_rows 
              }
          }
    ''';

    var snapshot = await _hasuraConnect.mutation(insert, variables: {
      "email": email,
      "user_type_id": 1,
      "role_id": 1,
      "user_status_id": 1,

    });

    return snapshot["data"]["user_insert"]["affected_rows"] > 0;

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
