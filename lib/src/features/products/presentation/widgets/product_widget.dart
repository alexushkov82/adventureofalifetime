import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/routes.dart';
import '../../domain/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.item.replaceFirst(':productId', product.id));
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Image.network(product.image ?? '', fit: BoxFit.fitHeight),
              ),
              SizedBox(height: 10),
              Text(
                product.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Text(
                '\$${product.price}',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  print('On Add to Cart');
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
