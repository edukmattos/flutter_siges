import 'package:mobx/mobx.dart';

part 'material_edit_controller.g.dart';

class MaterialEditController = _MaterialEditBase with _$MaterialEditController;

abstract class _MaterialEditBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
