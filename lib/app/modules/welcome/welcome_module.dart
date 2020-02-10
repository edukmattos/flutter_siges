import 'package:flutter_siges/app/modules/welcome/welcome_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/welcome/welcome_page.dart';

class WelcomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WelcomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => WelcomePage()),
      ];

  static Inject get to => Inject<WelcomeModule>.of();
}
