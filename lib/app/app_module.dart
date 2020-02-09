import 'package:flutter_siges/app/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'config/hasura_config.dart';
import 'modules/auth/auth_module.dart';
import 'modules/auth/register/register_module.dart';
import 'modules/client/client_module.dart';
import 'pages/splash/splash_controller.dart';
import 'pages/splash/splash_page.dart';
import 'pages/welcome/welcome_controller.dart';
import 'pages/welcome/welcome_page.dart';
import 'repositories/user_repository.dart';

class AppModule extends MainModule {
  final SharedPreferences sharedPreferences;

  AppModule(this.sharedPreferences);

  @override
  List<Bind> get binds => [
        Bind((i) => AuthRepository()),
        Bind((i) => UserRepository()),
        Bind((i) => WelcomeController()),
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => sharedPreferences),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/welcome',
            child: (_, args) => WelcomePage(),
            transition: TransitionType.rightToLeft),
        Router('/auth',
            module: AuthModule(), transition: TransitionType.rightToLeft),
        Router('/auth/register',
            module: RegisterModule(), transition: TransitionType.rightToLeft),
        Router('/clients',
            module: ClientModule(), transition: TransitionType.rightToLeft),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
