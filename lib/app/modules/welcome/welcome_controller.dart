import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'welcome_controller.g.dart';

class WelcomeController = _WelcomeBase with _$WelcomeController;

abstract class _WelcomeBase with Store {
  
  Future<bool> userLogged() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.get('token');

    return token != null;
  }
}
