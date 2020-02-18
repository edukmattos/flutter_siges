import 'package:mobx/mobx.dart';

import '../../../models/client_model.dart';
import '../../../repositories/client_repository.dart';

part 'client_list_controller.g.dart';

class ClientListController = _ClientListBase with _$ClientListController;

abstract class _ClientListBase with Store {

  final ClientRepository _clientRepository;

  String errorTitle;
  String errorMsg;

  _ClientListBase(this._clientRepository) {
    clients = ObservableStream(_clientRepository.getClients());
  }

  @observable
  ObservableStream<List<ClientModel>> clients;
}
