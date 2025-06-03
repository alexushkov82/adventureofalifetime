import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartState(productsInCart: {})) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
    add(LoadCart());
  }

  factory CartBloc.of(BuildContext context) {
    return BlocProvider.of<CartBloc>(context);
  }

  void _onLoadCart(event, emit) {
    final productsInCart = cartRepository.getAllProducts();
    emit(CartState(productsInCart: productsInCart));
  }

  Future<void> _onAddToCart(event, emit) async {
    final productsInCart = state.productsInCart;
    final productId = event.productId;

    if (productsInCart.containsKey(productId)) {
      productsInCart[productId] = productsInCart[productId]! + 1;
    } else {
      productsInCart[productId] = 1;
    }

    await cartRepository.saveProduct(productId, productsInCart[productId]!);

    emit(CartState(productsInCart: productsInCart));
  }

  Future<void> _onRemoveFromCart(event, emit) async {
    final productsInCart = state.productsInCart;
    final productId = event.productId;

    if (productsInCart.containsKey(productId)) {
      if (productsInCart[productId]! > 1) {
        productsInCart[productId] = productsInCart[productId]! - 1;
        await cartRepository.saveProduct(productId, productsInCart[productId]!);
      } else {
        productsInCart.remove(productId);
        await cartRepository.deleteProduct(productId);
      }
    }

    emit(CartState(productsInCart: productsInCart));
  }

  Future<void> _onClearCart(event, emit) async {
    await cartRepository.deleteAllProducts();
    emit(CartState(productsInCart: {}));
  }
}