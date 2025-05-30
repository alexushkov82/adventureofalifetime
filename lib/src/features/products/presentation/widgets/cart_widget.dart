import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Center(child: Text('Cart Screen')),
    );
  }
}