  import 'package:flutter_siges/app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/auth/register/register_module.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/auth/auth_module.dart';
import 'modules/client/client_module.dart';
import 'pages/splash/splash_controller.dart';
import 'pages/splash/splash_page.dart';
import 'pages/welcome/welcome_controller.dart';
import 'pages/welcome/welcome_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => UserRepository()),Bind((i) => WelcomeController()),Bind((i) => SplashController()),Bind((i) => AppController()),];

  @override
  List<Router> get routers => [
    //Router('/', child: (_, args) => SplashPage()),
    Router('/welcome', child: (_, args) => WelcomePage(), transition: TransitionType.rightToLeft),
    Router('/auth', module: AuthModule(), transition: TransitionType.rightToLeft),
    Router('/auth/register', module: RegisterModule(), transition: TransitionType.rightToLeft),
    Router('/', module: ClientModule(), transition: TransitionType.rightToLeft),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();

}
  