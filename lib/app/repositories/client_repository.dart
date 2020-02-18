import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/models/client_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ClientRepository extends Disposable {

  final HasuraConnect _hasuraConnect;
  ClientRepository(this._hasuraConnect);

  Stream<List<ClientModel>> getClients() {
    var select = '''
      subscription getClients {
        clients {
          id
          ein_ssa
          name
          email
        }
      }
    ''';

    var snapshot = _hasuraConnect.subscription(select);

    print("snapshot: $snapshot");
    
    return snapshot.map((data) => ClientModel.fromJsonList(data['data']['clients']));
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
