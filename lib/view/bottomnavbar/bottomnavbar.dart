import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/view/bill/bill_screen.dart';
// import 'package:flutter_application_chuyenman/view/cart/cart_screen.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:flutter_application_chuyenman/view/settings/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final pages = <Widget>[
    const HomeScreen(),

    const BillScreen(
      cartItems: [],
      currentAddress: '',
      phoneNumber: '',
      totalPrice: 0,
      // userName: '',
    ),
    const SettingScreen()
    // const Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: pages.elementAt(selectedIndex),
          ),
          BottomNavigationBar(
              currentIndex: selectedIndex,
              elevation: 1,
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Trang chủ",
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.shopping_cart),
                //   label: "Cart",
                // ),
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
              // selectedItemColor: kPrimaryColor,
              unselectedItemColor: const Color(0xff000000).withOpacity(0.5),
              // selectedIconTheme: const IconThemeData(color: kPrimaryColor),
              unselectedIconTheme: IconThemeData(
                  color: const Color(0xff000000).withOpacity(0.5)))
        ],
      ),
    );
  }
}
