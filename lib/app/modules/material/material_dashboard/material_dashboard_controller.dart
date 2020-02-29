import 'package:flutter_siges/app/models/material_dashboard_model.dart';
import 'package:mobx/mobx.dart';

import '../../../repositories/material_repository.dart';

part 'material_dashboard_controller.g.dart';

class MaterialDashboardController = _MaterialDashboardBase
    with _$MaterialDashboardController;

abstract class _MaterialDashboardBase with Store {

  final MaterialRepository _materialRepository;

  _MaterialDashboardBase(this._materialRepository) {
    count = ObservableStream(_materialRepository.repoMaterialsCount());
    print("materialsCount: $count");
  }

  @observable
  ObservableStream<dynamic> count;
}
