// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/network/data_state/data_state.dart';
import 'package:flutter_application_chuyenman/network/remote/models/food_category_item.dart';
import 'package:flutter_application_chuyenman/network/remote/models/shopping_item.dart';
import 'package:flutter_application_chuyenman/network/repositories/home_repository_impl.dart';
import 'package:flutter_application_chuyenman/view/detaill_food/detail_food.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../common/authentication.dart';
// import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.args}) : super(key: key);
  final ScreenArgument args;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController usernamesController;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  String usernamesValue = '';
  bool isLoading = false;
  @override
  void initState() {
    usernamesController = TextEditingController(text: usernamesValue);
    super.initState();
    // _getItems();
    _getCategoryItems();
    // _postItems();
  }

  // ignore: unused_element
  // void _postItem() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   final response =
  //       await HomeRepositoryImpl().postListShoppingItem(ShoppingItem(
  //     model: modelController.text,
  //     name: nameController.text,
  //     price: int.tryParse(priceController.text) ?? 0,
  //   ));
  //   setState(() {
  //     isLoading = false;
  //   });
  //   if (response is DataSuccess) {
  //     Fluttertoast.showToast(
  //       msg: "Post Item thanh cong",
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.blue,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
  //     _getItems();
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: "Post Item that bai",
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
  //   }
  // }

  // List<ShoppingItem> shoppingList = [];

  // void _getItems() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   final response = await HomeRepositoryImpl().getListShoppingItem();

  //   if (response is DataSuccess) {
  //     setState(() {
  //       shoppingList = response.data?.listShoppingItem ?? [];
  //     });
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  List<FoodCategoryItem> categoryList = [];
  void _getCategoryItems() async {
    setState(() {
      isLoading = true;
    });
    final response = await HomeRepositoryImpl().getListCategoryItem();

    if (response is DataSuccess) {
      setState(() {
        categoryList = response.data?.listCategoryItem ?? [];
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    usernamesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffb4a0eb),
                Color(0xffd4cde8),
              ],
              stops: [0.0, 1.0],
            ),
          ),
          // appBar: AppBar(
          //   centerTitle: true,
          //   backgroundColor: Colors.blue,
          //   title: const Text("Danh sách thẻ"),
          // ),
          width: double.infinity,
          height: double.infinity,
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 26),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Text(
                        'Welcome, ${widget.args.usernameValue?.split('@')?.first ?? "null"}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  // ElevatedButton(onPressed: () {}, child: Text("ChangeTheme")),
                  // Container(
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       // ignore: deprecated_member_use
                  //       primary: const Color(0xff8359E3),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(35),
                  //       ),
                  //     ),
                  //     onPressed: () async {
                  //       try {
                  //         await Auth().logOut();
                  //       } catch (error) {
                  //         // ignore: avoid_print
                  //         print(error.toString());
                  //       }
                  //     },
                  //     child: const Text(
                  //       "Log out",
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.only(left: 19, top: 32),
                    width: 353,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(0, 0, 0, 0.1),
                    ),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search, color: Colors.black),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'What are we eating today?',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 19, top: 20),
                    child: Text(
                      "Choose Category",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    // width: double.infinity,
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: false,
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              child: Image.network(
                                categoryList[index].imageCategory ?? "",
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              categoryList[index].textCategory ?? "",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Text("Recommended",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    width: 400,
                    height: 350,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.only(top: 0),
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailFood(
                                              image_category:
                                                  categoryList[index]
                                                      .imageCategory,
                                              text_category: categoryList[index]
                                                  .textCategory,
                                            )));
                              },
                              child: Container(
                                width: 353,
                                height: 100,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Column(
                                          children: [
                                            Text(categoryList[index]
                                                    .textCategory ??
                                                ""),
                                            Text(categoryList[index]
                                                .priceCategory
                                                .toString()),
                                            // Text(shoppingList[index].model ?? ""),
                                            // Text(shoppingList[index]
                                            //     .price
                                            //     .toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Image.network(
                                      categoryList[index].imageCategory ?? "",
                                      width: 120,
                                      height: 100,
                                    ),
                                    // Expanded(
                                    //   child: Column(),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: GNav(
            gap: 20,
            backgroundColor: Color.fromARGB(255, 148, 56, 142),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blueGrey,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite_outline,
                text: "Like",
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: "Cart",
                onPressed: () {
                  Navigator.pushNamed(context, "/cart_screen");
                },
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              )
            ]),
      ),
    );
  }
}

class ScreenArgument {
  final String usernameValue;

  ScreenArgument({required this.usernameValue});
}

  // Form(
                  //     child: Column(
                  //   children: [
                  //     TextFormField(
                  //       controller: nameController,
                  //       decoration: const InputDecoration(labelText: "Name"),
                  //     ),
                  //     TextFormField(
                  //       controller: modelController,
                  //       decoration: const InputDecoration(labelText: "Model"),
                  //     ),
                  //     TextFormField(
                  //       controller: priceController,
                  //       decoration: const InputDecoration(labelText: "Price"),
                  //     ),
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           _postItem();
                  //         },
                  //         child: const Text("submit"))
                  //   ],
                  // )),
                  // Container(
                  //   child: SingleChildScrollView(
                  //     child: Row(
                  //       children: [
                  //         ListView.builder(
                  //             itemBuilder: (context, index) => Container(
                  //                   color: Colors.blue,
                  //                 ))
                  //       ],
                  //     ),
                  //   ),
                  // ),

                   // ignore: avoid_unnecessary_containers
                