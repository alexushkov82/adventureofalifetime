import 'dart:convert';
import 'package:http/http.dart';

import '../../domain/models/products.dart';
import '../services/api_service.dart';
import 'products_repository.dart';

class ProductsRepositoryImpl /*implements*/ extends ProductsRepository {
  final ApiService apiService;

  ProductsRepositoryImpl(this.apiService);

  @override
  Future<Products> fetchProducts(int limit) async {
    final response =
        await apiService.get(path: '/products', params: {'limit': '$limit'}) as Response;
    final products = Products.empty();
    if (response.statusCode == 200) {
      final entities = jsonDecode(response.body)["products"] as List;
      products.addAll(Products.fromJson(entities));
    }
    return products;
  }
}
