import 'package:adventureofalifetime/src/features/cart/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final productsInCart = state.productsInCart;
          return Card(
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
                  if (productsInCart.containsKey(product.id)) ...[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            CartBloc.of(context).add(AddToCart(product.id));
                          },
                          child: Text('+'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${productsInCart[product.id]}',
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            CartBloc.of(context).add(RemoveFromCart(product.id));
                          },
                          child: Text('-'),
                        ),
                      ],
                    )
                  ] else ...[
                    ElevatedButton(
                      onPressed: () {
                        CartBloc.of(context).add(AddToCart(product.id));
                      },
                      child: Text('Add to Cart'),
                    ),
                  ],
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
