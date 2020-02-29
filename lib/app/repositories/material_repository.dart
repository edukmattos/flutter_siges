import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../models/material_model.dart';
import '../models/material_dashboard_model.dart';

class MaterialRepository extends Disposable {

  final HasuraConnect _hasuraConnect;
  MaterialRepository(this._hasuraConnect);

  Stream<List<MaterialModel>> getMaterials() {
    var select = '''
      subscription getMaterials {
        materials {
          id
          code
          description
          material_unit_id
          material_unit {
            id
            code
            description
          }
          created_at
          updated_at
          deleted_at
        }
      }
    ''';

    var snapshot = _hasuraConnect.subscription(select);

    //print("snapshot: $snapshot");
    
    return snapshot.map((data) => MaterialModel.fromJsonList(data['data']['materials']));
  }

  Stream<Map<String,dynamic>> repoMaterialsCount() {

    var select = '''
      subscription materialsCount {
        materials_aggregate {
          aggregate {
            count
          }
        }
      }
    ''';

    var snapshot = _hasuraConnect.subscription(select);
    
    //return snapshot.map((data) => MaterialDashboardModel.fromMap(data['data']['materials_aggregate']['aggregate']['count']));
     

    snapshot.listen((data) {
      print(data['data']['materials_aggregate']['aggregate']['count']);
      return MaterialDashboardModel.fromMap(data['data']['materials_aggregate']['aggregate']['count']);
    }).onError((err) {
      print(err);
    });
  }

  Future<bool> save(String code, String descrption, String email) async {
    var insert = '''
      mutation materialSave(\$code: String, \$descrption: String, \$email: String) {
        insert_materials(objects: {code: \$code, descrption: \$descrption, email: \$email}) {
          affected_rows
        }
      }
    ''';
    await _hasuraConnect.mutation(insert, variables: {
        "code": code,
        "descrption": descrption,
        "email": email
      }
    );   

    //print("return  ${snapshot["data"]["affected_rows"]}");

    //return snapshot["data"]["affected_rows"] > 0;

    return true;

    
  }

  Future<bool> materialUpdate(String code, String descrption, String email) async {
    var insert = '''
      mutation materialSave(\$code: String, \$descrption: String, \$email: String) {
        insert_materials(objects: {code: \$code, descrption: \$descrption, email: \$email}) {
          affected_rows
        }
      }
    ''';
    var snapshot = await _hasuraConnect.mutation(insert, variables: {
        "code": code,
        "descrption": descrption,
        "email": email
      }
    );

    return snapshot["data"]["affected_rows"] > 0;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
