import 'package:flutter_siges/app/models/material_model.dart';

abstract class IMaterialRepository {

  Stream<List<MaterialModel>> getMaterials(); 

}