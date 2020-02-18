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

  Future<bool> clientSave(String einSsa, String name, String email) async {
    var insert = '''
      mutation clientSave(\$einSsa: String, \$name: String, \$email: String) {
        insert_clients(objects: {ein_ssa: \$einSsa, name: \$name, email: \$email}) {
          affected_rows
        }
      }
    ''';
    var snapshot = await _hasuraConnect.mutation(insert, variables: {
        "einSaa": einSsa,
        "name": name,
        "email": email
      }
    );

    return snapshot["data"]["affected_rows"] > 0;
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
        "einSaa": einSsa,
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
