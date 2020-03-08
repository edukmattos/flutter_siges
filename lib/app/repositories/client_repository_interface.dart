import 'package:flutter_siges/app/models/client_model.dart';

abstract class IClientRepository {

  Stream<List<ClientModel>> getClients(); 

}