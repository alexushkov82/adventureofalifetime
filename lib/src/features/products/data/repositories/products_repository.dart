import '../../domain/models/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> fetchProducts(int limit);
}
