import 'package:flutter_siges/app/modules/material/material_edit/material_edit_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/material/material_edit/material_edit_page.dart';

class MaterialEditModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialEditController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialEditPage()),
      ];

  static Inject get to => Inject<MaterialEditModule>.of();
}
