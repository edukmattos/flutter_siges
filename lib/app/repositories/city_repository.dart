import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/models/city_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class CityRepository extends Disposable {

  final HasuraConnect _hasuraConnect;

  CityRepository(this._hasuraConnect);

  Future<List<CityModel>> getCities() {
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

    //var snapshot = _hasuraConnect.query(select);


    //return CityModel.fromJsonList(snapshot["data"]["city"] as List);
  }
  

  //dispose will be called automatically
  @override
  void dispose() {}
}
