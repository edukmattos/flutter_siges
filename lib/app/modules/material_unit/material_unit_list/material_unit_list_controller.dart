import 'package:mobx/mobx.dart';

part 'material_unit_list_controller.g.dart';

class MaterialUnitListController = _MaterialUnitListControllerBase
    with _$MaterialUnitListController;

abstract class _MaterialUnitListControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
