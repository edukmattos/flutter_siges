import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  
  //Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.get('token');

    return token != null;
  }

  Future<String> getPrefsUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String prefsUserEmail = prefs.getString('userEmail');
    print ("prefsUserEmail1: $prefsUserEmail");
    return prefsUserEmail;
  }
}
  