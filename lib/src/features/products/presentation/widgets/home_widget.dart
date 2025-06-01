import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/router/routes.dart';
import '../../../../di/di.dart';
import '../bloc/products_bloc/products_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = (constraints.maxWidth / 200).floor();
            return BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductsLoaded) {
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
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
                    },
                  );
                } else {
                  return const Center(child: Text('No products available.'));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
