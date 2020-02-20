import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/city/city_list/city_list_module.dart';
import 'package:flutter_siges/app/modules/material/material_list/material_list_module.dart';
import 'package:flutter_siges/app/modules/product/product_list/product_list_module.dart';
import 'package:flutter_siges/app/repositories/city_repository.dart';
import 'package:flutter_siges/app/repositories/material_repository.dart';
import 'package:flutter_siges/app/repositories/product_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'config/hasura_config.dart';
import 'modules/auth/auth_module.dart';
import 'modules/auth/register/register_module.dart';
import 'modules/client/client_list/client_list_module.dart';
import 'modules/client/client_new/client_new_module.dart';
import 'modules/splash/splash_controller.dart';
import 'modules/splash/splash_module.dart';
import 'modules/welcome/welcome_controller.dart';
import 'modules/welcome/welcome_module.dart';
import 'repositories/client_repository.dart';
import 'repositories/user_repository.dart';

class AppModule extends MainModule {
  final SharedPreferences sharedPreferences;

  AppModule(this.sharedPreferences);

  @override
  List<Bind> get binds => [
        //Repositories
        Bind((i) => MaterialRepository(i.get<HasuraConnect>())),
        Bind((i) => ClientRepository(i.get<HasuraConnect>())),
        Bind((i) => CityRepository(i.get<HasuraConnect>())),
        Bind((i) => ProductRepository(i.get<HasuraConnect>())),
        //Bind((i) => AuthRepository(i.get<HasuraConnect>())),
        Bind((i) => UserRepository()),
        //Controllers
        Bind((i) => WelcomeController()),
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        //Others
        Bind((i) => sharedPreferences),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router('/',
            module: SplashModule(), transition: TransitionType.rightToLeft),
        Router('/welcome',
            module: WelcomeModule(), transition: TransitionType.rightToLeft),
        Router('/auth',
            module: AuthModule(), transition: TransitionType.rightToLeft),
        Router('/auth/register',
            module: RegisterModule(), transition: TransitionType.rightToLeft),
        Router('/clients',
            module: ClientListModule(), transition: TransitionType.rightToLeft),
        Router('/clients/new',
            module: ClientNewModule(), transition: TransitionType.rightToLeft),
        Router('/materials',
            module: MaterialListModule(), transition: TransitionType.rightToLeft),
        Router('/cities',
            module: CityListModule(), transition: TransitionType.rightToLeft),
        Router('/products',
            module: ProductListModule(), transition: TransitionType.rightToLeft),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
