import 'package:mobx/mobx.dart';

part 'welcome_controller.g.dart';

class WelcomeController = _WelcomeBase with _$WelcomeController;

abstract class _WelcomeBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
  