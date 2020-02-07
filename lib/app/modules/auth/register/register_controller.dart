import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterBase with _$RegisterController;

abstract class _RegisterBase with Store {

  //_RegisterBase({Auth firebaseAuth})
  //    : _firebaseAuth = firebaseAuth ?? auth();

  //final Auth _firebaseAuth;
  
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
  Future<bool> register() async {
    //await _firebaseAuth.createUserWithEmailAndPassword(email, password);
    return true;
  }
}