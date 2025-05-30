import 'dart:convert';
import 'package:http/http.dart';

import '../../domain/models/product.dart';
import '../services/api_service.dart';
import 'products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ApiService apiService;

  ProductsRepositoryImpl(this.apiService);

  @override
  Future<List<Product>> fetchProducts(int limit) async {
    final response = await apiService.get(path: '/products', params: {'limit': '$limit'}) as Response;
    final List<Product> list = [];
    if (response.statusCode == 200) {
      final entities = jsonDecode(response.body)["products"] as List;
      for (var entity in entities) {
        list.add(Product.fromJson(entity));
      }
    }
    return list;
  }
}