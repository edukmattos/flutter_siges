import 'package:mobx/mobx.dart';

part 'client_show_controller.g.dart';

class ClientShowController = _ClientShowBase with _$ClientShowController;

abstract class _ClientShowBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
