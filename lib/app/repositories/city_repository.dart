import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/models/city_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class CityRepository extends Disposable {

  final HasuraConnect _hasuraConnect;
  CityRepository(this._hasuraConnect);

  Stream<List<CityModel>> getCities() {
    var select = '''
      subscription getCities {
        cities {
          id
          description
          state {
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

    print("snapshot: $snapshot");
    
    return snapshot.map((data) => CityModel.fromJsonList(data['data']['cities']));
  }
  

  //dispose will be called automatically
  @override
  void dispose() {}
}
