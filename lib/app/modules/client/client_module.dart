import 'package:flutter_siges/app/modules/client/client_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/client/client_list_page.dart';

class ClientModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientListPage()),
      ];

  static Inject get to => Inject<ClientModule>.of();
}
