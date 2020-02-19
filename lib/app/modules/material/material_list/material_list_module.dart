import 'package:flutter_siges/app/modules/material/material_list/material_list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/material/material_list/material_list_page.dart';
import 'package:flutter_siges/app/repositories/material_repository.dart';

class MaterialListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialListController(i.get<MaterialRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialListPage()),
      ];

  static Inject get to => Inject<MaterialListModule>.of();
}
