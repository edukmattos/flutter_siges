  import 'package:flutter_siges/app/modules/auth/auth_controller.dart';
  import 'package:flutter_modular/flutter_modular.dart';
  import 'package:flutter_siges/app/modules/auth/auth_page.dart';
  class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => AuthController()),];

  @override
  List<Router> get routers => [Router('/', child: (_, args) => AuthPage()),];

  static Inject get to => Inject<AuthModule>.of();

}
  