import 'package:flutter_siges/app/models/material_model.dart';
import 'package:flutter_siges/app/repositories/material_repository.dart';
import 'package:mobx/mobx.dart';

part 'material_list_controller.g.dart';

class MaterialListController = _MaterialListBase with _$MaterialListController;

abstract class _MaterialListBase with Store {
  final MaterialRepository _materialRepository;

  _MaterialListBase(this._materialRepository) {
    materials = ObservableStream(_materialRepository.getMaterials());
  }

  @observable
  ObservableStream<List<MaterialModel>> materials;
}
