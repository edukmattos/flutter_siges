import 'package:flutter/material.dart';
import 'package:flutter_siges/app/modules/client/client_edit/client_edit_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/client/client_edit/client_edit_page.dart';
import 'package:flutter_siges/app/repositories/client_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ClientEditModule extends ChildModule {

  final String clientId;

  ClientEditModule({@required this.clientId});

  @override
  List<Bind> get binds => [
        // Repositories
        Bind((i) => ClientRepository(i.get<HasuraConnect>())),
        // Controllers
        Bind((i) => ClientEditController(i.get<ClientRepository>(), i.params["clientId"]), singleton: false),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientEditPage()),
      ];

  static Inject get to => Inject<ClientEditModule>.of();
}
