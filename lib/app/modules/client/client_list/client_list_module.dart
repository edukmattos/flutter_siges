import 'package:flutter_modular/flutter_modular.dart';

import '../../../modules/client/client_list/client_list_page.dart';
import '../../../repositories/client_hasura_repository.dart';
import '../../../repositories/client_repository_interface.dart';
import 'client_list_controller.dart';

class ClientListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controllers
        Bind((i) => ClientListController(i.get())),

        Bind<IClientRepository>((i) => ClientHasuraRepository(i.get())),
        //Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientListPage()),
      ];

  static Inject get to => Inject<ClientListModule>.of();
}
