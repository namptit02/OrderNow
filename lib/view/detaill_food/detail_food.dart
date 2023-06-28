import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';
import 'package:flutter_application_chuyenman/view/cart/cart_screen.dart';
import 'package:flutter_application_chuyenman/view/cart/view_cart/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailFood extends StatelessWidget {
  final String image_category;
  final String text_category;
  final String store;
  final int price;
  const DetailFood({
    Key? key,
    required this.image_category,
    required this.text_category,
    required this.store,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Food'),
        backgroundColor: Color.fromARGB(255, 148, 56, 142),
      ),
      body: Container(
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
                  image_category,
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
                        color: Color.fromRGBO(0, 0, 0, 0.1),
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
                          text_category,
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
                              store,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              Text(
                                "\$${price.toString()}",
                                style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 30,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  height: 1.0,
                                  letterSpacing: 3.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: Container(
                                  width: 174,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 148, 56, 142),
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        final cartItem = CartItem(
                                          image: image_category,
                                          text: text_category,
                                          price: price,
                                          quantity: 0,
                                        );
                                        context
                                            .read<CartCubit>()
                                            .addToCart(cartItem);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CartScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 174,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Color.fromARGB(255, 148, 56, 142),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
