import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientBase with _$ClientController;

abstract class _ClientBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
  