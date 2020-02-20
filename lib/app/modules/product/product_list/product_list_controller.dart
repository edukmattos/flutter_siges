import 'package:mobx/mobx.dart';

import '../../../models/product_model.dart';
import '../../../repositories/product_repository.dart';

part 'product_list_controller.g.dart';

class ProductListController = _ProductListBase with _$ProductListController;

abstract class _ProductListBase with Store {

  final ProductRepository _productRepository;

  String errorTitle;
  String errorMsg;

  _ProductListBase(this._productRepository) {
    products = ObservableStream(_productRepository.getProducts());
  }

  @observable
  ObservableStream<List<ProductModel>> products;
}

