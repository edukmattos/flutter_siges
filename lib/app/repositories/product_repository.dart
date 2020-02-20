import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/models/product_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ProductRepository extends Disposable {

  final HasuraConnect _hasuraConnect;
  ProductRepository(this._hasuraConnect);

  Stream<List<ProductModel>> getProducts() {
    var select = '''
      subscription getProducts {
        products {
          id
          code
          description
          product_type_id
          product_type {
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
    
    return snapshot.map((data) => ProductModel.fromJsonList(data['data']['Products']));
  }
  

  //dispose will be called automatically
  @override
  void dispose() {}
}
