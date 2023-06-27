import 'package:flutter_application_chuyenman/network/data_state/data_state.dart';
import 'package:flutter_application_chuyenman/network/remote/models/get_food.dart';
// import 'package:flutter_application_chuyenman/network/remote/models/get_shopping.dart';
// import 'package:flutter_application_chuyenman/network/remote/models/post_shopping_item.dart';
// import 'package:flutter_application_chuyenman/network/remote/models/shopping_item.dart';

abstract class HomeRepository {
  // Future<DataState<GetShoppingListItemResponse>> getListShoppingItem();
  // Future<DataState<PostShoppingListItemResponse>> postListShoppingItem(
  //     ShoppingItem item);
  Future<DataState<GetCategoryListItemResponse>> getListCategoryItem();
}
