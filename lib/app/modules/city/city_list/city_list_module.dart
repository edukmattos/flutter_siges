import 'package:flutter_siges/app/modules/city/city_list/city_list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/city/city_list/city_list_page.dart';
import 'package:flutter_siges/app/repositories/city_repository.dart';

class CityListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CityListController(i.get<CityRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CityListPage()),
      ];

  static Inject get to => Inject<CityListModule>.of();
}
