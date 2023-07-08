import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_chuyenman/common/authentication.dart';
import 'package:flutter_application_chuyenman/network/data_state/data_state.dart';
import 'package:flutter_application_chuyenman/network/remote/models/food_item.dart';
import 'package:flutter_application_chuyenman/network/repositories/home_repository_impl.dart';

import 'package:flutter_application_chuyenman/view/detaill_food/view_food.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

// class _AdminScreenState extends State<AdminScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Trang admin"),
//       ),
//       body: Container(
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             // ignore: deprecated_member_use
//             primary: const Color(0xff8359E3),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(35),
//             ),
//           ),
//           onPressed: () async {
//             try {
//               await Auth().logOut();
//             } catch (error) {
//               // ignore: avoid_print
//               print(error.toString());
//             }
//           },
//           child: const Text(
//             "Log out",
//           ),
//         ),
//       ),
//     );
//   }
// }
class _AdminScreenState extends State<AdminScreen> {
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
      appBar: AppBar(title: const Text("Admin")),
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
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: const Color(0xff8359E3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      await Auth().logOut();
                    } catch (error) {
                      // ignore: avoid_print
                      print(error.toString());
                    }
                  },
                  child: const Text(
                    "Log out",
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 60, left: 26),
                //   // ignore: avoid_unnecessary_containers
                //   child: Container(
                //     child: Text(
                //       'Welcome, ${widget.args.usernameValue.split('@').first}',
                //       style: const TextStyle(
                //           fontSize: 20, fontWeight: FontWeight.w600),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
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
                              categoryList[index].imageCategory,
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categoryList[index].type,
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
                const Padding(
                  padding: EdgeInsets.only(left: 19),
                  child: Text("Recommended",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                Container(
                  width: 400,
                  height: 350,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(top: 0),
                  child: SingleChildScrollView(
                    child: Column(
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
                                      builder: (context) => ViewFood(
                                            idDetailFood:
                                                categoryList[index].idCategory,
                                            imageDetailFood: categoryList[index]
                                                .imageCategory,
                                            textDetailFood: categoryList[index]
                                                .textCategory,
                                            storeDetailFood:
                                                categoryList[index].store,
                                            priceDetailFood: categoryList[index]
                                                .priceCategory,
                                            // userName: "",
                                          )));
                              // Navigator.pushNamed(context, "/detail_food", );
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
                                  SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Column(
                                        children: [
                                          Text(
                                            categoryList[index].textCategory,
                                            style: const TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w700,
                                              height: 1.2,
                                              letterSpacing: 3.0,
                                            ),
                                          ),
                                          Text(
                                            "\$${categoryList[index].priceCategory.toString()}",
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
                                    ),
                                  ),
                                  Image.network(
                                    categoryList[index].imageCategory,
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
                          separatorBuilder: (context, index) => const SizedBox(
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
    );
  }
}

// class ScreenArgument {
//   final String usernameValue;

//   ScreenArgument({required this.usernameValue});
// }
