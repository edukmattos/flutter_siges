import 'package:flutter_modular/flutter_modular.dart';

import '../../../repositories/auth_repository.dart';
import 'register_controller.dart';
import 'register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controllers
        //Bind((i) => RegisterController(i.get<AuthRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
