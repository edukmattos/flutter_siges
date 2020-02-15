import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_siges/app/app_module.dart';
import 'package:flutter_siges/app/modules/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/auth/auth_page.dart';
import 'package:flutter_siges/app/repositories/auth_repository.dart';
import 'package:flutter_siges/app/widgets/custom_hasura_connect_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register/register_controller.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Controllers
        Bind((i) => AuthController()),
        Bind((i) => RegisterController()),
        // Repositories
        Bind((i) => AuthRepository()),

        // Others
        Bind((i) => CustomHasuraConnectWidget.getConnect(i.get<FirebaseAuth>())),
        Bind((i) => FirebaseAuth.instance)
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
