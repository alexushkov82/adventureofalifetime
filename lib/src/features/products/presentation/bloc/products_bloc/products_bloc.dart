import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/products_repository.dart';
import '../../../domain/models/products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;

  ProductsBloc(this.productsRepository) : super(ProductsLoading()) {
    on<LoadProducts>(_onLoadProducts);
    add(LoadProducts());
  }

  factory ProductsBloc.of(BuildContext context) {
    return BlocProvider.of<ProductsBloc>(context);
  }

  Future<void> _onLoadProducts(event, emit) async {
    emit(ProductsLoading());
    try {
      final products = await productsRepository.fetchProducts(10);
      emit(ProductsLoaded(products));
    } catch (e) {
      print(e.toString());
    }
  }
}