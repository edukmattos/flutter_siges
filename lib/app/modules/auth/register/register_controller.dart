import 'package:firebase_auth/firebase_auth.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../../repositories/auth_repository.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterBase with _$RegisterController;

abstract class _RegisterBase with Store {

  final AuthRepository _authRepository;  
  _RegisterBase(this._authRepository);
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _errorMsg;

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

  @observable
  String passwordConfirm;
  
  @action
  changePasswordConfirm(String value) => passwordConfirm = value;

  @computed
  bool get isFormValid {
    return validateEmail() == null && validatePassword() == null && validatePasswordConfirm() == null;
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

  String validatePasswordConfirm() {
    if (validatorRequired(passwordConfirm)) return "Obrigatorio.";
    if (password != passwordConfirm) return "Senhas NAO conferem.";
    return null;
  }

  @action
  Future<dynamic> signUp() async { 
    print(email);
    try {
      AuthResult result = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
      ));
      
      var user = result.user;

      var tokenId = await user.getIdToken();

      var valid = tokenId != null;

      _singUpHasura();

      return valid;

    } catch (e) {
      print(e.code);

      switch (e.code) {
        case 'auth/email-already-in-use':
          _errorMsg = 'Ops... E-mail indisponivel !';
          print(_errorMsg);
          break;
                  
        default:
      }
    }
  }

  _singUpHasura() {
    _authRepository.signUpHasura(email);
  }
}