import 'product.dart';

class Products extends Iterable<Product> {
  final List<Product> _products;

  Products(this._products);

  factory Products.fromJson(List<dynamic> json) {
    final products = json.map((item) => Product.fromJson(item)).toList();
    return Products(products);
  }

  Products.empty() : _products = [];

  Product operator [](int index) => _products[index];

  void add(Product product) {
    _products.add(product);
  }

  void addAll(Iterable<Product> products) {
    _products.addAll(products);
  }

  Product? getById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  @override
  Iterator<Product> get iterator => _products.iterator;

  @override
  int get length => _products.length;
}
