import 'package:flutter_siges/app/repositories/client_repository_interface.dart';
import 'package:mobx/mobx.dart';

import '../../../models/client_model.dart';
import '../../../repositories/client_hasura_repository.dart';

part 'client_list_controller.g.dart';

class ClientListController = _ClientListBase with _$ClientListController;

abstract class _ClientListBase with Store {

  final IClientRepository repository;

  _ClientListBase(IClientRepository this.repository) {
    allClients();
  }

  @observable
  ObservableStream<List<ClientModel>> clients;

  @action
  allClients(){
    clients = repository.getClients().asObservable();
  }

  //Future save(ClientModel model) => repository.save(model);


  //Future delete(ClientModel model) => repository.delete(model);}

}
