import 'package:mobx/mobx.dart';

import '../../../models/client_model.dart';
import '../../../repositories/client_repository_interface.dart';

part 'client_dashboard_controller.g.dart';

class ClientDashboardController = _ClientDashboardControllerBase
    with _$ClientDashboardController;

abstract class _ClientDashboardControllerBase with Store {

  final IClientRepository repository;

  _ClientDashboardControllerBase(IClientRepository this.repository) {
    allClients();
  }

  @observable
  ObservableStream<List<ClientModel>> clients;

  @action
  allClients(){
    clients = repository.getClients().asObservable();
  }
}