import 'package:flutter_siges/app/app_module.dart';
import 'package:flutter_siges/app/modules/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/auth/auth_page.dart';
import 'package:flutter_siges/app/widgets/custom_hasura_connect_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register/register_controller.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthController(AppModule.to.get<SharedPreferences>())),
        Bind((i) => RegisterController(AppModule.to.get<SharedPreferences>())),
        Bind((i) => CustomHasuraConnectWidget.getConnect(AppModule.to.get<SharedPreferences>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
