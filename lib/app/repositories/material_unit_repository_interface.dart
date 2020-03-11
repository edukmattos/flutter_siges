import '../models/material_unit_model.dart';

abstract class IMaterialUnitRepository {

  Stream<List<MaterialUnitModel>> getMaterialUnits(); 

}