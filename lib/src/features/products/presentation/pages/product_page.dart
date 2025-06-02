import 'package:flutter/material.dart';

import '../../../../di/di.dart';
import '../bloc/products_bloc/products_bloc.dart';

class ProductPage extends StatelessWidget {
  final String productId;

  const ProductPage({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    final productsState = getIt<ProductsBloc>().state as ProductsLoaded;
    final product = productsState.products.getById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(product?.title ?? 'Product')),
      body: Center(
        child: product != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.image ?? '',
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 10),
            Text(
              product.description ?? 'No description available',
              textAlign: TextAlign.center,
            ),
          ],
        )
            : const Text('Product not found'),
      ),
    );
  }
}
