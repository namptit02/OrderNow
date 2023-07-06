// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_application_chuyenman/common/authentication.dart';
// import 'package:flutter_application_chuyenman/network/data_state/data_state.dart';
// import 'package:flutter_application_chuyenman/network/remote/models/food_item.dart';
// import 'package:flutter_application_chuyenman/network/repositories/home_repository_impl.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeCubit extends Cubit<DataState<List<FoodCategoryItem>>> {
//   final TextEditingController usernamesController;
//   final TextEditingController nameController;
//   final TextEditingController modelController;
//   final TextEditingController priceController;
//   String usernamesValue = '';
//   bool isLoading = false;
//   List<FoodCategoryItem> categoryList = [];
//   List<FoodCategoryItem> filteredCategoryList = [];

//   HomeCubit()
//       : usernamesController = TextEditingController(),
//         nameController = TextEditingController(),
//         modelController = TextEditingController(),
//         priceController = TextEditingController(),
//         super(DataLoading()) {
//     _getCategoryItems();
//   }

//   void _getCategoryItems() async {
//     emit(DataLoading());

//     final response = await HomeRepositoryImpl().getListCategoryItem();

//     if (response is DataSuccess) {
//       categoryList = response.data?.listCategoryItem ?? [];
//       filteredCategoryList = categoryList;
//       emit(DataSuccess(categoryList));
//     } else if (response is DataError) {
//       emit(DataError(response.errorMessage));
//     }
//   }

//   void filterCategoryList(String keyword) {
//     if (keyword.isEmpty) {
//       filteredCategoryList = categoryList;
//     } else {
//       filteredCategoryList = categoryList
//           .where((item) =>
//               item.textCategory.toLowerCase().contains(keyword.toLowerCase()))
//           .toList();
//     }
//     emit(DataSuccess(filteredCategoryList));
//   }

//   void logOut() async {
//     try {
//       await Auth().logOut();
//       final prefs = await SharedPreferences.getInstance();
//       prefs.remove("loginData");
//       final googleSignIn = GoogleSignIn();
//       await googleSignIn.signOut();
//     } catch (error) {
//       print(error.toString());
//     }
//   }

//   @override
//   Future<void> close() {
//     usernamesController.dispose();
//     nameController.dispose();
//     modelController.dispose();
//     priceController.dispose();
//     return super.close();
//   }
// }
