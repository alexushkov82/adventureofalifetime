import '../services/hive_service.dart';
import 'cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final HiveService _hiveService;

  CartRepositoryImpl(this._hiveService);

  @override
  Future<void> saveProduct(String key, int value) async {
    await _hiveService.cartBox.put(key, value);
  }

  @override
  String? getProduct(String key) {
    return _hiveService.cartBox.get(key);
  }

  @override
  Future<void> deleteProduct(String key) async {
    await _hiveService.cartBox.delete(key);
  }

  @override
  Map<String, int> getAllProducts() {
    final Map<String, int> productsInCart = {};
    for (var key in _hiveService.cartBox.keys) {
      final value = _hiveService.cartBox.get(key).toString();
      productsInCart[key] = int.parse(value);
    }
    return productsInCart;
  }

  @override
  Future<void> deleteAllProducts() async {
    await _hiveService.cartBox.clear();
  }
}