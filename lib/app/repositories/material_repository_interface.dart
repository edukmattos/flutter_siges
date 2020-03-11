import 'package:flutter_siges/app/models/material_model.dart';
import 'package:flutter_siges/app/models/material_unit_model.dart';

abstract class IMaterialRepository {

  Stream<List<MaterialModel>> getMaterials(); 
  Stream<List<MaterialUnitModel>> getMaterialUnits(); 

}