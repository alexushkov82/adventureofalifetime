abstract class CartRepository {
  Future<void> saveProduct(String key, int value);
  String? getProduct(String key);
  Future<void> deleteProduct(String key);
  Map<String, int> getAllProducts();
  Future<void> deleteAllProducts();
}