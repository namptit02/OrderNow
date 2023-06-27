import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';

// import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = widget.cartItems[index];
          return ListTile(
            leading: Image.network(cartItem.image),
            title: Text(cartItem.text),
            subtitle: Text('Price: \$${cartItem.price.toString()}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Xử lý xóa sản phẩm khỏi danh sách cartItems
              },
            ),
          );
        },
      ),
    );
  }
}
