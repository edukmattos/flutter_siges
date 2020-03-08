import 'package:flutter_modular/flutter_modular.dart';

import '../../../repositories/material_hasura_repository.dart';
import 'material_dashboard_controller.dart';
import 'material_dashboard_page.dart';

class MaterialDashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialDashboardController(i.get<MaterialHasuraRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialDashboardPage()),
      ];

  static Inject get to => Inject<MaterialDashboardModule>.of();
}
