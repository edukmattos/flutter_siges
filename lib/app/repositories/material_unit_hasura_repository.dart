import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/repositories/material_unit_repository_interface.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../models/material_unit_model.dart';
import '../modules/material_unit/documents/material_unit_document.dart';

class MaterialUnitHasuraRepository extends Disposable implements IMaterialUnitRepository {

  final HasuraConnect _hasuraConnect;
  MaterialUnitHasuraRepository(this._hasuraConnect);

  Stream<List<MaterialUnitModel>> getMaterialUnits() {
    return _hasuraConnect.subscription(docAllMaterialUnits).map((event) { 
      return (event['data']['material_units'] as List).map((json) {
        return MaterialUnitModel.fromJson(json);
      }).toList();
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
