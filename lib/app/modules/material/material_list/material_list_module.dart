import 'package:flutter_modular/flutter_modular.dart';

import '../../../modules/material/material_list/material_list_page.dart';
import '../../../repositories/material_hasura_repository.dart';
import '../../../repositories/material_repository_interface.dart';
import 'material_list_controller.dart';


class MaterialListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controllers
        Bind((i) => MaterialListController(i.get())),

        Bind<IMaterialRepository>((i) => MaterialHasuraRepository(i.get())),
        //Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialListPage()),
      ];

  static Inject get to => Inject<MaterialListModule>.of();
}
