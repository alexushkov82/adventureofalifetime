import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/presentation/bloc/products_bloc/products_bloc.dart';
import '../bloc/cart_bloc/cart_bloc.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsState = ProductsBloc.of(context).state as ProductsLoaded;

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.productsInCart.isEmpty) {
            return Center(child: Text('Cart is Empty'));
          } else {
            final productsInCart = state.productsInCart;
            return ListView.builder(
              itemCount: productsInCart.length,
              itemBuilder: (context, index) {
                final productId = productsInCart.keys.toList()[index];
                final product = productsState.products.getById(productId);
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Image.network(product?.image ?? '', height: 100, width: 100),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product?.title ?? '',
                                textAlign: TextAlign.left,
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '\$${product?.price}',
                                style: TextStyle(fontSize: 20, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                CartBloc.of(context).add(AddToCart(productId));
                              },
                              child: Text('+'),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '${productsInCart[productId]}',
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                CartBloc.of(context).add(RemoveFromCart(productId));
                              },
                              child: Text('-'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}