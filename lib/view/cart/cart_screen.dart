import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';

import 'package:flutter_application_chuyenman/view/cart/view_cart/cart_cubit.dart';

import 'package:flutter_application_chuyenman/view/map/map_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocConsumer<CartCubit, List<CartItem>>(
        listener: (context, cartItems) {},
        builder: (context, cartItems) {
          int totalPrice =
              context.select((CartCubit cartCubit) => cartCubit.totalPrice);

          if (cartItems.isEmpty) {
            return Center(
              child: Text('Your cart is empty.'),
            );
          }
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
                        leading: Image.network(cartItem.imageCart),
                        title: Text(cartItem.textCart),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Price: \$${cartItem.priceCart}'),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    int newQuantity = cartItem.quantityCart - 1;
                                    if (newQuantity >= 0) {
                                      context.read<CartCubit>().updateQuantity(
                                          cartItem, newQuantity);
                                    }
                                  },
                                ),
                                Text(cartItem.quantityCart.toString()),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    int newQuantity = cartItem.quantityCart + 1;
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
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<CartCubit>().removeFromCart(cartItem);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: cartItems.isEmpty
                      ? null // Disable button if cart is empty
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapScreen(),
                            ),
                          );
                        },
                  child: const Text('Confirm'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  // ignore: unnecessary_brace_in_string_interps
                  'Total Price: \$${totalPrice}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
