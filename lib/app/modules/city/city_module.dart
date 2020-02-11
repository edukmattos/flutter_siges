import 'package:flutter_siges/app/modules/city/city_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/city/city_list_page.dart';
import 'package:flutter_siges/app/repositories/city_repository.dart';

class CityModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CityController(i.get<CityRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CityListPage()),
      ];

  static Inject get to => Inject<CityModule>.of();
}
