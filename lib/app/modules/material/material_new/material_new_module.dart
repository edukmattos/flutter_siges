import 'package:flutter_siges/app/modules/material/material_new/material_new_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/material/material_new/material_new_page.dart';
import 'package:flutter_siges/app/repositories/material_repository.dart';

class MaterialNewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialNewController(i.get<MaterialRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialNewPage()),
      ];

  static Inject get to => Inject<MaterialNewModule>.of();
}
