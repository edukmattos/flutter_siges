import 'package:mobx/mobx.dart';

import '../../../models/client_model.dart';
import '../../../repositories/client_repository.dart';

part 'client_dashboard_controller.g.dart';

class ClientDashboardController = _ClientDashboardControllerBase
    with _$ClientDashboardController;

abstract class _ClientDashboardControllerBase with Store {
  
  final ClientRepository _clientRepository;

  _ClientDashboardControllerBase(this._clientRepository) {
    clients = ObservableStream(_clientRepository.getClients());
  }

  @observable
  ObservableStream<List<ClientModel>> clients;
}
