import 'package:flutter_siges/app/modules/client/client_list/client_list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/client/client_list/client_list_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../repositories/client_repository.dart';

class ClientListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Repositories
        //Bind((i) => ClientRepository(i.get<HasuraConnect>())),
        // Controllers
        Bind((i) => ClientListController(i.get<ClientRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientListPage()),
      ];

  static Inject get to => Inject<ClientListModule>.of();
}
