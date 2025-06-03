import '../../domain/models/products.dart';

abstract class ProductsRepository {
  Future<Products> fetchProducts();
}
