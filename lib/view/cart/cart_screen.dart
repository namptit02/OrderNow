import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';
import 'package:flutter_application_chuyenman/view/bottom_nav_bar/bottom_navbar_cubit.dart';
import 'package:flutter_application_chuyenman/view/cart/view_cart/cart_cubit.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:flutter_application_chuyenman/view/map/map_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<CartCubit, List<CartItem>>(
        builder: (context, cartItems) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  width: 400,
                  height: 400,
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return ListTile(
                        leading: Image.network(cartItem.image),
                        title: Text(cartItem.text),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Price: \$${cartItem.price.toString()}'),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    int newQuantity = cartItem.quantity - 1;
                                    if (newQuantity >= 0) {
                                      context.read<CartCubit>().updateQuantity(
                                          cartItem, newQuantity);
                                    }
                                  },
                                ),
                                Text(cartItem.quantity.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    int newQuantity = cartItem.quantity + 1;
                                    context
                                        .read<CartCubit>()
                                        .updateQuantity(cartItem, newQuantity);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context.read<CartCubit>().removeFromCart(cartItem);
                          },
                        ),
                      );
                    },
                    // itemBuilder: (context, index) {
                    //   final cartItem = cartItems[index];
                    //   return ListTile(
                    //     leading: Image.network(cartItem.image),
                    //     title: Text(cartItem.text),
                    //     subtitle: Text('Price: \$${cartItem.price.toString()}'),
                    //     trailing: IconButton(
                    //       icon: Icon(Icons.delete),
                    //       onPressed: () {
                    //         context.read<CartCubit>().removeFromCart(cartItem);
                    //       },
                    //     ),
                    //   );
                    // },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapScreen(),
                      ),
                    );
                  },
                  child: Text('Confirm'),
                ),
              ),
            ],
          );
          // ignore: dead_code
        },
      ),
    );
  }
}
