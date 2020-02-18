import 'package:flutter_siges/app/models/client_model.dart';
import 'package:flutter_siges/app/repositories/client_repository.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientBase with _$ClientController;

abstract class _ClientBase with Store {
  final ClientRepository _cityRepository;

  String errorTitle;
  String errorMsg;

  _ClientBase(this._cityRepository) {
    clients = ObservableStream(_cityRepository.getClients());
  }

  @observable
  ObservableStream<List<ClientModel>> clients;  

  @observable
  String name;
  
  @action
  changeName(String value) => name = value;

  @observable
  String einSsa;
  
  @action
  changeEinSsa(String value) => einSsa = value;

  @observable
  String email;
  
  @action
  changeEmail(String value) => email = value;

  @action
  signUp() {

  }

  @computed
  bool get isFormValid {
    return validateEinSsa() == null && validateName() == null && validateEmail() == null;
  }
  
  String validateEinSsa() {
    if (validatorRequired(einSsa)) return "Obrigatorio.";
    if (validatorCpf(einSsa)) return "Invalido.";
    return null;
  }
  
  String validateName() {
    if (validatorRequired(name)) return "Obrigatorio.";
    return null;
  }

  String validateEmail() {
    if (validatorRequired(email)) return "Obrigatorio.";
    if (validatorEmail(email)) return "Invalido.";
    return null;
  }

}
  