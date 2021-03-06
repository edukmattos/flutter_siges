import 'package:flutter_modular/flutter_modular.dart';

import '../../../repositories/material_hasura_repository.dart';
import '../../../repositories/material_repository_interface.dart';
import 'material_new_controller.dart';
import 'material_new_page.dart';

class MaterialNewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controllers
        Bind((i) => MaterialNewController(i.get<IMaterialRepository>())),

        // Repositories
        Bind<IMaterialRepository>((i) => MaterialHasuraRepository(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialNewPage()),
      ];

  static Inject get to => Inject<MaterialNewModule>.of();
}
