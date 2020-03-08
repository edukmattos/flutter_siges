import 'package:mobx/mobx.dart';

import '../../../repositories/material_repository_interface.dart';

part 'material_dashboard_controller.g.dart';

class MaterialDashboardController = _MaterialDashboardBase
    with _$MaterialDashboardController;

abstract class _MaterialDashboardBase with Store {

  final IMaterialRepository _repository;

  _MaterialDashboardBase(this._repository) {
    //count = ObservableStream(_repository.repoMaterialsCount());
    print("materialsCount: $count");
  }

  @observable
  ObservableStream<dynamic> count;
}
