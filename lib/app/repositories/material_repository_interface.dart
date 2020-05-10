import '../modules/material/models/material_model.dart';
import '../modules/material/models/material_unit_model_dto.dart';

abstract class IMaterialRepository {

  Stream<List<MaterialModel>> getMaterials(); 
  Future<MaterialUnitModelDto> getMaterialUnits(); 

}