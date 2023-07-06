import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/common/authentication.dart';
import 'package:flutter_application_chuyenman/components/app_colors.dart';
import 'package:flutter_application_chuyenman/network/data_state/data_state.dart';
import 'package:flutter_application_chuyenman/network/remote/models/food_item.dart';
import 'package:flutter_application_chuyenman/network/repositories/home_repository_impl.dart';

import 'package:flutter_application_chuyenman/view/detaill_food/detail_food.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  List<FoodCategoryItem> categoryList = [];
  List<FoodCategoryItem> filteredCategoryList =
      []; // Danh sách món ăn sau khi lọc
  int selectedNavItem = 0;

  @override
  void initState() {
    usernamesController = TextEditingController(text: usernamesValue);
    super.initState();
    _getCategoryItems();
  }

  void _getCategoryItems() async {
    setState(() {
      isLoading = true;
    });
    final response = await HomeRepositoryImpl().getListCategoryItem();

    if (response is DataSuccess) {
      setState(() {
        categoryList = response.data?.listCategoryItem ?? [];
        filteredCategoryList = categoryList; // Khởi tạo danh sách lọc ban đầu
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

  void filterCategoryList(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        // Nếu từ khóa trống, hiển thị tất cả các món
        filteredCategoryList = categoryList;
      } else {
        // Lọc danh sách món ăn dựa trên từ khóa
        filteredCategoryList = categoryList
            .where((item) =>
                item.textCategory.toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
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
                // Color(0xffb4a0eb),
                AppColors.primaryColor,
                AppColors.backgroundColor
                // Color(0xffd4cde8),
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
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 26),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          'Welcome, ${widget.args.usernameValue.split('@').first}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff8359E3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          onPressed: () async {
                            try {
                              await Auth().logOut();
                              // Xóa thông tin đăng nhập đã lưu trong SharedPreferences
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("loginData");

                              // Ngắt kết nối tài khoản Google
                              final googleSignIn = GoogleSignIn();
                              // await googleSignIn.disconnect();
                              await googleSignIn.signOut();
                              // Xóa token xác thực của tài khoản Google (nếu có)
                            } catch (error) {
                              print(error.toString());
                            }
                          },
                          child: const Text(
                            "Log out",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 19, top: 10),
                  width: MediaQuery.of(context).size.width *
                      0.8, // Sử dụng MediaQuery để tính toán chiều rộng
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: filterCategoryList,
                          decoration: const InputDecoration(
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
                                color: AppColors.backgroundCategoryColor),
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(top: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filteredCategoryList
                              .length, // Hiển thị danh sách đã được lọc
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailFood(
                                    idDetailFood:
                                        filteredCategoryList[index].idCategory,
                                    imageDetailFood: filteredCategoryList[index]
                                        .imageCategory,
                                    textDetailFood: filteredCategoryList[index]
                                        .textCategory,
                                    storeDetailFood:
                                        filteredCategoryList[index].store,
                                    priceDetailFood: filteredCategoryList[index]
                                        .priceCategory,
                                    userName: widget.args.usernameValue,
                                  ),
                                ),
                              );
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
                                            filteredCategoryList[index]
                                                .textCategory,
                                            style: const TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w700,
                                              height: 1.2,
                                              letterSpacing: 3.0,
                                            ),
                                          ),
                                          Text(
                                            "\$${filteredCategoryList[index].priceCategory.toString()}",
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
                                    filteredCategoryList[index].imageCategory,
                                    width: 120,
                                    height: 100,
                                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenArgument {
  final String usernameValue;

  ScreenArgument({required this.usernameValue});
}
