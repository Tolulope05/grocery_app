import 'package:flutter/material.dart';
import '../../screens/cart/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CartWidget();
        },
      ),
    );
  }
}
