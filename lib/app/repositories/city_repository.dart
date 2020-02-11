import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/models/city_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class CityRepository extends Disposable {

  final HasuraConnect _hasuraConnect;

  CityRepository(this._hasuraConnect);

  Future<List<String>> getCities() async {
    var select = '''
      query getCities {
        cities {
          id
          description
          regions {
            id
            code
            description
          }
        }
      }
    ''';

    var snapshot = await _hasuraConnect.query(select);
    
    return CityModel.fromJsonList(snapshot);
  }
  

  //dispose will be called automatically
  @override
  void dispose() {}
}
