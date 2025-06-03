part of 'cart_bloc.dart';

abstract class CartEvent {}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final String productId;

  AddToCart(this.productId);
}

class RemoveFromCart extends CartEvent {
  final String productId;

  RemoveFromCart(this.productId);
}

class ClearCart extends CartEvent {}