import '../services/hive_service.dart';
import 'cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final HiveService _hiveService;

  CartRepositoryImpl(this._hiveService);

  @override
  Future<void> saveProduct(String key, String value) async {
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
  List<String> getAllProducts() {
    return _hiveService.cartBox.keys.map((key) => _hiveService.cartBox.get(key)).toList().cast<String>();
  }
}