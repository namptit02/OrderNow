import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/view/bill/bill_screen.dart';
import 'package:flutter_application_chuyenman/view/cart/cart_screen.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<DoctorData> doctorList = [];

  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final pages = <Widget>[
    HomeScreen(),
    CartScreen(
      cartItems: [],
      // username: '',
    ),
    const BillScreen(
      cartItems: [],
      currentAddress: '',
      phoneNumber: '',
      totalPrice: 0,
      // userName: '',
    ),
    // const Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: pages[selectedIndex],
          ),
          BottomNavigationBar(
              currentIndex: selectedIndex,
              elevation: 1,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Trang chủ",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.money),
                  label: "Bill",
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
