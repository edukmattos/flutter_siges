import 'package:flutter_modular/flutter_modular.dart';

import '../../../repositories/material_hasura_repository.dart';
import 'material_new_controller.dart';
import 'material_new_page.dart';

class MaterialNewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialNewController(i.get<MaterialHasuraRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialNewPage()),
      ];

  static Inject get to => Inject<MaterialNewModule>.of();
}
