import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/models/client_model.dart';
import 'package:flutter_siges/app/modules/client/documents/client_document.dart';
import 'package:flutter_siges/app/repositories/client_repository_interface.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ClientHasuraRepository extends Disposable implements IClientRepository {

  final HasuraConnect _hasuraConnect;
  ClientHasuraRepository(this._hasuraConnect);

  Stream<List<ClientModel>> getClients() {
    return _hasuraConnect.subscription(docAllClients).map((event) { 
      return (event['data']['clients'] as List).map((json) {
        return ClientModel.fromJson(json);
      }).toList();
    });
  }

  @override
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

  @override
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

  @override
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

  //Future<bool> delete(ClientModel model);


  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Stream<List<ClientModel>> getIClients() {
    // TODO: implement getIClients
    throw UnimplementedError();
  }
}
