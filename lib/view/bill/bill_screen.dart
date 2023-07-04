import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:http/http.dart' as http;

class BillScreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final String currentAddress;
  final int totalPrice;
  final String phoneNumber;
  final String userName;
  const BillScreen({
    Key? key,
    required this.cartItems,
    required this.currentAddress,
    required this.totalPrice,
    required this.phoneNumber,
    required this.userName,
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
          title: const Text('Đặt hàng thành công'),
          content: const Text('Thông tin đơn hàng đã được gửi thành công.'),
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
    } else {
      // Đặt hàng thất bại
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Đặt hàng thất bại'),
          content:
              const Text('Có lỗi xảy ra khi đặt hàng. Vui lòng thử lại sau.'),
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
        backgroundColor: Colors.deepPurple,
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
              children: [
                Text(
                  'Shipping Address: $currentAddress',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Phone Number: $phoneNumber",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Username: $userName",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
            onPressed: () => _placeOrder(
                context), // Gọi hàm _placeOrder khi nhấn nút "Đặt hàng"
            child: const Text('Đặt hàng'),
          ),
        ],
      ),
    );
  }
}
