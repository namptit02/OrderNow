import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
              colors: [
                Color(0xFFBBA9ED), // replace with your desired starting color
                Color(0xFFFEFEFE), // replace with your desired ending color
              ],
              stops: [
                0.0909, // replace with your desired stop value for the first color
                1.2359, // replace with your desired stop value for the second color
              ],
              // you can also adjust the angle and center of the gradient if needed
              // angle: 293.67 * (pi / 180),
              // center: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
