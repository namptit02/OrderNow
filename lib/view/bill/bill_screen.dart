import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/components/app_colors.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';

import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class BillScreen extends StatelessWidget {
  String _getCurrentDateTime() {
    final now = DateTime.now();
    final formattedDate = DateFormat('HH:mm:ss dd/MM/yyyy').format(now);
    return formattedDate;
  }

  final List<CartItem> cartItems;
  final String currentAddress;
  final int totalPrice;
  final String phoneNumber;
  final String userName;
  final VoidCallback removeCartItems;
  const BillScreen({
    Key? key,
    required this.cartItems,
    required this.currentAddress,
    required this.totalPrice,
    required this.phoneNumber,
    required this.userName,
    required this.removeCartItems,
  }) : super(key: key);

  Future<void> _placeOrder(BuildContext context) async {
    // Chuyển đổi danh sách cartItems thành chuỗi JSON
    final List<String> cartItemsJson =
        cartItems.map((item) => item.toJson()).toList();

    // Tạo payload dữ liệu để gửi lên Firebase
    final Map<String, dynamic> payload = {
      'cartItems': cartItemsJson,
      'address': currentAddress,
      'totalPrice': totalPrice,
      'phoneNumber': phoneNumber,
      'userName': userName
    };

    // Gửi POST request để lưu thông tin hóa đơn lên Firebase
    final response = await http.post(
      Uri.parse(
          'https://fir-project-1724a-default-rtdb.asia-southeast1.firebasedatabase.app/bills.json'),
      body: json.encode(payload), // Chuyển đổi payload thành chuỗi JSON
    );

    if (response.statusCode == 200) {
      // Đặt hàng thành công
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Order successfully'),
          content: const Text('Order information has been sent successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      args: ScreenArgument(usernameValue: userName),
                    ),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      removeCartItems();
    } else {
      // Đặt hàng thất bại
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Order failed'),
          content: const Text(
              'An error occurred while placing an order. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill'),
        backgroundColor: AppColors.appbar,
      ),
      body: Column(
        children: [
          Expanded(
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
                      Text('Quantity: ${cartItem.quantityCart}'),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Shipping Address:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        currentAddress,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Phone Number:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        phoneNumber,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Username:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Current Time:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _getCurrentDateTime(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    AppColors.backgroundButton)),
            onPressed: () => _placeOrder(
                context), // Gọi hàm _placeOrder khi nhấn nút "Đặt hàng"
            child: const Text('Đặt hàng'),
          ),
        ],
      ),
    );
  }
}
