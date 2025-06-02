import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../products/domain/models/product.dart';
import '../../../data/repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartState(productsInCart: {})) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
  }

  factory CartBloc.of(BuildContext context) {
    return BlocProvider.of<CartBloc>(context);
  }

  Future<void> _onAddToCart(event, emit) async {
    final productsInCart = state.productsInCart;
    final productId = event.productId;

    if (productsInCart.containsKey(productId)) {
      productsInCart[productId] = productsInCart[productId]! + 1;
    } else {
      productsInCart[productId] = 1;
    }

    emit(CartState(productsInCart: productsInCart));
  }

  void _onRemoveFromCart(event, emit) {
    final productsInCart = state.productsInCart;
    final productId = event.productId;

    if (productsInCart.containsKey(productId)) {
      if (productsInCart[productId]! > 1) {
        productsInCart[productId] = productsInCart[productId]! - 1;
      } else {
        productsInCart.remove(productId);
      }
    }

    emit(CartState(productsInCart: productsInCart));
  }

  void _onClearCart(event, emit) {
    emit(CartState(productsInCart: {}));
  }
}