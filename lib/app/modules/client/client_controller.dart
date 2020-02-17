import 'package:flutter_siges/app/models/client_model.dart';
import 'package:flutter_siges/app/repositories/client_repository.dart';
import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientBase with _$ClientController;

abstract class _ClientBase with Store {
  final ClientRepository _cityRepository;

  _ClientBase(this._cityRepository) {
    clients = ObservableStream(_cityRepository.getClients());
  }

  @observable
  ObservableStream<List<ClientModel>> clients;  
}
  