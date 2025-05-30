import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _routes = [
    AppRoutes.home,
    AppRoutes.cart,
  ];

  void _onItemTapped(int index) {
    context.go(_routes[index]);
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}