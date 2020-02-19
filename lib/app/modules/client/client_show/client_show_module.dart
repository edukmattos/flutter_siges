import 'package:flutter_siges/app/modules/client/client_show/client_show_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/client/client_show/client_show_page.dart';

class ClientShowModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientShowController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientShowPage()),
      ];

  static Inject get to => Inject<ClientShowModule>.of();
}
