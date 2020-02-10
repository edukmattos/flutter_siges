import 'package:firebase_auth/firebase_auth.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterBase with _$RegisterController;

abstract class _RegisterBase with Store {

  final SharedPreferences sharedPreferences;
  _RegisterBase(this.sharedPreferences);
  
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
    final FirebaseAuth _auth = FirebaseAuth.instance;
    print(email);
    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      )).user;

        var tokenId = await user.getIdToken();

        var valid = tokenId != null;

        if(valid) {
          sharedPreferences.setString("token", tokenId.token);
        }

        return valid;

    } catch (e) {
      print(e);
    }
  }
}