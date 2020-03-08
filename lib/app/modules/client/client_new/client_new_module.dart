import 'package:flutter_modular/flutter_modular.dart';

import '../../../repositories/client_hasura_repository.dart';
import 'client_new_controller.dart';
import 'client_new_page.dart';

class ClientNewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientNewController(i.get<ClientHasuraRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientNewPage()),
      ];

  static Inject get to => Inject<ClientNewModule>.of();
}
