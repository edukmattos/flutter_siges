import 'package:flutter_siges/app/models/client_model.dart';
import 'package:flutter_siges/app/repositories/client_repository.dart';
import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientBase with _$ClientController;

abstract class _ClientBase with Store {
  final ClientRepository _cityRepository;

  _ClientBase(this._cityRepository) {
    _cityRepository.getClients().then((data) => clients = data);
  }

  @observable
  List<ClientModel> clients = [];  
}
  