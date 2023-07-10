import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/components/app_colors.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';
import 'package:flutter_application_chuyenman/view/bill/bill_screen.dart';

import 'package:flutter_application_chuyenman/view/cart/view_cart/cart_cubit.dart';

// import 'package:flutter_application_chuyenman/view/map/map_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final String phoneNumber;
  final String userName;
  // ignore: non_constant_identifier_names
  final String current_address;
  const CartScreen(
      {Key? key,
      required this.cartItems,
      required this.phoneNumber,
      required this.userName,
      // ignore: non_constant_identifier_names
      required this.current_address})
      : super(key: key);
  // void _removeAllItems(BuildContext context) {
  //   context.read<CartCubit>().removeAllItems();
  // }

  @override
  Widget build(BuildContext context) {
    print("phoneNumber o CartScreen:${phoneNumber}");
    print("username o CartScreen:${userName}");
    print("currentaddress o CartScreen:${current_address}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
        backgroundColor: AppColors.appbar,
      ),
      body: BlocConsumer<CartCubit, List<CartItem>>(
        listener: (context, cartItems) {},
        builder: (context, cartItems) {
          int totalPrice =
              context.select((CartCubit cartCubit) => cartCubit.totalPrice);

          if (cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty.'),
            );
          }
          return Column(
            children: [
              Expanded(
                child: SizedBox(
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
                            Text(cartItem.storeCart),
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
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.backgroundButton),
                  ),
                  onPressed: cartItems.isEmpty
                      ? null
                      : () {
                          List<String> storeNames = [];
                          for (final cartItem in cartItems) {
                            storeNames.add(cartItem.storeCart);
                          }

                          bool sameStore =
                              storeNames.every((name) => name == storeNames[0]);

                          if (sameStore) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BillScreen(
                                    cartItems: cartItems,
                                    currentAddress:
                                        current_address, // Truyền địa chỉ vào đây
                                    totalPrice: totalPrice,
                                    phoneNumber: phoneNumber,
                                    userName: userName, time: '',
                                  ),
                                ));
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Invalid Order'),
                                  content: const Text(
                                      'Please select items from the same store.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                  child: const Text('Confirm',
                      style: TextStyle(color: Colors.white)),
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
