import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../models/material_unit_model.dart';

class MaterialUnitRepository extends Disposable {

  final HasuraConnect _hasuraConnect;
  MaterialUnitRepository(this._hasuraConnect);

  Future<MaterialUnitModel>  getMaterialUnits() async {
    var select = '''
      query getMaterialUnits {
        material_units {
          id
          code
          description
          created_at
          updated_at
          deleted_at
        }
      }
    ''';

    var snapshot = await _hasuraConnect.query(select);

    return MaterialUnitModel.fromMap(snapshot['data']['material_units']);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
