import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../../repositories/material_repository_interface.dart';
import '../models/material_unit_model_dto.dart';

part 'material_new_controller.g.dart';

class MaterialNewController = _MaterialNewBase with _$MaterialNewController;

abstract class _MaterialNewBase with Store {
  
  final IMaterialRepository repository; 
  
  _MaterialNewBase(IMaterialRepository this.repository) {
    allMaterialUnits();
  }

  @observable
  ObservableStream<List<MaterialUnitModelDto>> materialUnits;

  @action
  allMaterialUnits(){
    materialUnits = repository.getMaterialUnits().asObservable();
    print("ok");
  }
  
  @observable
  String code;
  
  @action
  changeCode(String value) => code = value;
  
  @observable
  String description;

  @action
  changeDescription(String value) => description = value;

  @observable
  String materialUnitId;
  
  @action
  changeMaterialUnitId(String value) => materialUnitId = value;

  //@action
  //Future<bool> save() async {
    //return await repository.save(code, description, materialUnitId);
  //}

  @computed
  bool get isFormValid {
    return true;
    //return validateEinSsa() == null && validateName() == null && validateEmail() == null;
  }
  
  String validateCode() {
    if (validatorRequired(code)) return "Obrigatorio.";
    return null; 
  }
  
  String validateDescription() {
    if (validatorRequired(description)) return "Obrigatorio.";
    return null;
  }

  String validateMaterialUnitId() {
    if (validatorRequired(materialUnitId)) return "Obrigatorio.";
    return null;
  }

}

