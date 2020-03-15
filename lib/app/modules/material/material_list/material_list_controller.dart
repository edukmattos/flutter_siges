import 'package:mobx/mobx.dart';

import '../../../repositories/material_repository_interface.dart';
import '../models/material_model.dart';

part 'material_list_controller.g.dart';

class MaterialListController = _MaterialListBase with _$MaterialListController;

abstract class _MaterialListBase with Store {
  
  final IMaterialRepository repository;

  _MaterialListBase(IMaterialRepository this.repository) {
    allMaterials();
  }

  @observable 
  ObservableStream<List<MaterialModel>> materials;

  @action
  allMaterials(){
    materials = repository.getMaterials().asObservable();
  }

}
