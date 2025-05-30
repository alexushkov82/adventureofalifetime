import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/home'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}
