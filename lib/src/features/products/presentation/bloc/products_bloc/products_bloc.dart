import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/products_repository.dart';
import '../../../domain/models/product.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository repository;

  ProductsBloc(this.repository) : super(ProductsLoading());

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is LoadProducts) {
      yield ProductsLoading();
      try {
        final products = await repository.fetchProducts(10);
        yield ProductsLoaded(products);
      } catch (e) {
        yield ProductsError(e.toString());
      }
    }
  }
}