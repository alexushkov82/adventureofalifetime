import 'package:rxdart/rxdart.dart';

import '../../domain/models/products.dart';

abstract class ProductsRepository {
  // final _controller = BehaviorSubject<Products>();
  //
  // Products get products =>
  //     _controller.hasValue ? _controller.value : Products.empty();
  //
  // Stream<Products> get stream => _controller.stream.asBroadcastStream();
  //
  // void addToStream(Products products) => _controller.sink.add(products);

  Future<Products> fetchProducts(int limit);
}
