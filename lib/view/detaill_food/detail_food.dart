import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/components/app_colors.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';
import 'package:flutter_application_chuyenman/view/cart/cart_screen.dart';
import 'package:flutter_application_chuyenman/view/cart/view_cart/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_application_chuyenman/network/remote/models/detail_food.dart';

class DetailFood extends StatelessWidget {
  final int idDetailFood;
  final String imageDetailFood;
  final String textDetailFood;
  final String storeDetailFood;
  final int priceDetailFood;
  // final String userName;
  const DetailFood({
    Key? key,
    required this.idDetailFood,
    required this.imageDetailFood,
    required this.textDetailFood,
    required this.storeDetailFood,
    required this.priceDetailFood,
    // required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Food'),
        backgroundColor: AppColors.appbar,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                Color(0xffb4a0eb),
                Color(0xffd4cde8),
              ],
              stops: [
                0.0909,
                1.2359,
              ],
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  imageDetailFood,
                  width: 300,
                  height: 300,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 15,
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Text(
                          textDetailFood,
                          style: const TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: 3.0,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 148, 56, 142)),
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/logovitri.png"),
                            Text(
                              storeDetailFood,
                              style: const TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                                letterSpacing: 3.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 148, 56, 142)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: const [
                              Text(
                                "Price",
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 16,
                                  height: 1.2,
                                  letterSpacing: 3.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "\$${priceDetailFood.toString()}",
                              style: const TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 30,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                height: 1.0,
                                letterSpacing: 3.0,
                              ),
                            ),
                            Container(width: 60),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.backgroundButton)),
                              onPressed: () {
                                final cartItem = CartItem(
                                  idCart: idDetailFood,
                                  imageCart: imageDetailFood,
                                  textCart: textDetailFood,
                                  priceCart: priceDetailFood,
                                  quantityCart: 1,
                                );

                                context.read<CartCubit>().addToCart(cartItem);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(
                                      cartItems: const [],
                                      // username: userName,
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
