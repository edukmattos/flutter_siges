import 'package:flutter_siges/app/modules/material/material_dashboard/material_dashboard_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/material/material_dashboard/material_dashboard_page.dart';
import 'package:flutter_siges/app/repositories/material_repository.dart';

class MaterialDashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialDashboardController(i.get<MaterialRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialDashboardPage()),
      ];

  static Inject get to => Inject<MaterialDashboardModule>.of();
}
