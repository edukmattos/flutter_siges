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

  Future<ClientModel> getClientById(String clientId) async {
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
    
    //return snapshot.map((data) => ClientModel.fromJsonList(data['data']['clients']));
  }

  Future<bool> save(String einSsa, String name, String email) async {
    var insert = '''
      mutation clientSave(\$einSsa: String, \$name: String, \$email: String) {
        insert_clients(objects: {ein_ssa: \$einSsa, name: \$name, email: \$email}) {
          affected_rows
        }
      }
    ''';
    await _hasuraConnect.mutation(insert, variables: {
        "einSsa": einSsa,
        "name": name,
        "email": email
      }
    );

    //print("return  ${snapshot["data"]["affected_rows"]}");

    //return snapshot["data"]["affected_rows"] > 0;

    return true;

    
  }

  Future<bool> clientUpdate(String einSsa, String name, String email) async {
    var insert = '''
      mutation clientSave(\$einSsa: String, \$name: String, \$email: String) {
        insert_clients(objects: {ein_ssa: \$einSsa, name: \$name, email: \$email}) {
          affected_rows
        }
      }
    ''';
    var snapshot = await _hasuraConnect.mutation(insert, variables: {
        "einSsa": einSsa,
        "name": name,
        "email": email
      }
    );

    return snapshot["data"]["affected_rows"] > 0;
  }
  //dispose will be called automatically
  @override
  void dispose() {}
}
