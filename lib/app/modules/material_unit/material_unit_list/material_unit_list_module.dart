import 'package:flutter_siges/app/modules/material_unit/material_unit_list/material_unit_list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/material_unit/material_unit_list/material_unit_list_page.dart';

class MaterialUnitListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialUnitListController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => MaterialUnitListPage()),
      ];

  static Inject get to => Inject<MaterialUnitListModule>.of();
}
