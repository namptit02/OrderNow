import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/components/app_colors.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';
import 'package:flutter_application_chuyenman/view/bill/bill_screen.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:flutter_application_chuyenman/view/settings/settings_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  final int selectedIndex;
  final String phoneNumber;
  final String userName;
  // ignore: non_constant_identifier_names
  final String current_address;
  const BottomNavBarScreen({
    Key? key,
    required this.selectedIndex,
    required this.phoneNumber,
    // ignore: non_constant_identifier_names
    required this.userName,
    // ignore: non_constant_identifier_names
    required this.current_address,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedIndex = 0;

  late List<Widget> pages;
  List<CartItem> cartItems = [];
  @override
  void initState() {
    super.initState();

    pages = [
      HomeScreen(
        phoneNumber: widget.phoneNumber,
        userName: widget.userName,
        current_address: widget.current_address,
      ),
      BillScreen(
        cartItems: cartItems,
        userName: widget.userName,
        currentAddress: widget.current_address,
        phoneNumber: widget.phoneNumber,
        totalPrice: 0,
        time: '',
      ),
      const SettingScreen(),
    ];
  }

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void updateCartItems(List<CartItem> updatedCartItems) {
    setState(() {
      cartItems = updatedCartItems; // Cập nhật danh sách cartItems
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("Phone number o bottom navbar: ${widget.phoneNumber}");
    // ignore: avoid_print
    print("User name o bottom navabr: ${widget.userName}");
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          elevation: 1,
          backgroundColor: AppColors.appbar,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Trang chủ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: "Bill",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          onTap: onTabSelected,
          showSelectedLabels: true,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
          unselectedItemColor: AppColors.iconBottom),
    );
  }
}
