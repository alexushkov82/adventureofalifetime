abstract class CartRepository {
  Future<void> saveProduct(String key, String value);
  String? getProduct(String key);
  Future<void> deleteProduct(String key);
  List<String> getAllProducts();
}