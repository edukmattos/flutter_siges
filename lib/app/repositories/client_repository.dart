import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/models/client_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ClientRepository extends Disposable {

  final HasuraConnect _hasuraConnect;
  ClientRepository(this._hasuraConnect);

  Future<List<ClientModel>> getClients() async {
    var select = '''
      query getClients {
        clients {
          id
          ein_ssa
          name
          email
        }
      }
    ''';

    var snapshot = await _hasuraConnect.query(select);

    print("snapshot: $snapshot");
    
    return ClientModel.fromJsonList(snapshot['data']['clients'] as List);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
