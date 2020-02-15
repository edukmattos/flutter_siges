import 'package:firebase_auth/firebase_auth.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../repositories/auth_repository.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthBase with _$AuthController;

abstract class _AuthBase with Store {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _errorMsg;
  //final AuthRepository _authRepository;
  
  //_AuthBase(this._authRepository);

  @observable
  String name;
  
  @action
  changeName(String value) => name = value;

  @observable
  String email;
  
  @action
  changeEmail(String value) => email = value;

  @observable
  String password;
  
  @action
  changePassword(String value) => password = value;

  @computed
  bool get isFormValid {
    return validateEmail() == null && validatePassword() == null;
  }
  
  String validateEmail() {
    if (validatorRequired(email)) return "Obrigatorio.";
    if (validatorEmail(email)) return "Invalido.";
    return null;
  }

  String validatePassword() {
    if (validatorRequired(password)) return "Obrigatorio.";
    return null;
  }

  @action
  Future<dynamic> signIn() async { 
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
}