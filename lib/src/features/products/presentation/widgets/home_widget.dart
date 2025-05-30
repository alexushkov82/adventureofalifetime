import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/routes.dart';
import '../../../../di/di.dart';
import '../../data/repositories/products_repository.dart';
import '../bloc/products_bloc/products_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  ProductsRepository get productsRepository => getIt<ProductsRepository>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.push(AppRoutes.item),
                child: const Text('Go to the Item Screen'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final products = await productsRepository.fetchProducts(10);
                  inspect(products);
                },
                child: const Text('Fetch Products'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}