import 'package:flutter_siges/app/modules/city/city_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/city/city_list_page.dart';
import 'package:flutter_siges/app/repositories/city_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../config/hasura_config.dart';

class CityModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controllers
        Bind((i) => CityController(i.get<CityRepository>())),
        // Repositories
        Bind((i) => CityRepository(i.get<HasuraConnect>())),
        // Others
        //Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CityListPage()),
      ];

  static Inject get to => Inject<CityModule>.of();
}
