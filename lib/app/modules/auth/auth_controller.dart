import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthBase with _$AuthController;

abstract class _AuthBase with Store {

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
    if (validatorRequired(email)) return "Obrigatorio";
    if (validatorEmail(email)) return "Invalido";
    return null;
  }

  String validatePassword() {
    if (validatorRequired(password)) return "Obrigatorio";
    return null;
  }

  @action
  Future<bool> login() async {
    return false;
  }

}