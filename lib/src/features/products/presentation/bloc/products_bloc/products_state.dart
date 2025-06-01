part of 'products_bloc.dart';

abstract class ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final Products products;

  ProductsLoaded(this.products);
}