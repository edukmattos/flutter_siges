import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../modules/material/documents/material_document.dart';
import '../modules/material/models/material_model.dart';
import '../modules/material/models/material_unit_model_dto.dart';
import '../modules/material_unit/documents/material_unit_document.dart';
import 'material_repository_interface.dart';

class MaterialHasuraRepository extends Disposable implements IMaterialRepository {

  final HasuraConnect _hasuraConnect;
  MaterialHasuraRepository(this._hasuraConnect);

  Stream<List<MaterialModel>> getMaterials() {
    return _hasuraConnect.subscription(docAllMaterials).map((event) { 
      return (event['data']['materials'] as List).map((json) {
        return MaterialModel.fromJson(json);
      }).toList();
    });
  }

  Stream<List<MaterialUnitModelDto>> getMaterialUnits() {
    return _hasuraConnect.subscription(docAllMaterialUnits).map((event) { 
       return (event['data']['material_units'] as List).map((json) {
        return MaterialUnitModelDto.fromMap(json);
      }).toList();
    });

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
