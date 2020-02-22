import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/app_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../repositories/auth_repository.dart';
import '../../widgets/custom_hasura_connect_widget.dart';
import 'auth_controller.dart';
import 'auth_page.dart';
import 'register/register_controller.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Controllers
        Bind((i) => AuthController()),
        Bind((i) => RegisterController(i.get<AuthRepository>())),
        // Repositories
        Bind((i) => AuthRepository(AppModule.to.get<HasuraConnect>())),

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
