import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siges/app/repositories/auth_repository.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthBase with _$AuthController;

abstract class _AuthBase with Store {

  final AuthRepository _authRepository;
  final SharedPreferences sharedPreferences;

  _AuthBase(this._authRepository, this.sharedPreferences);

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

  signIn() { 
    _authRepository.signIn(email, password);
  }  
}