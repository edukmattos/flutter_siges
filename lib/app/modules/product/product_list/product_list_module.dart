import 'package:flutter_siges/app/modules/product/product_list/product_list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_siges/app/modules/product/product_list/product_list_page.dart';
import 'package:flutter_siges/app/repositories/product_repository.dart';

class ProductListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductListController(i.get<ProductRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ProductListPage()),
      ];

  static Inject get to => Inject<ProductListModule>.of();
}
