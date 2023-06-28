import 'package:flutter_application_chuyenman/network/remote/apis/home_api.dart';

import 'package:flutter_application_chuyenman/network/remote/models/get_food_category.dart';
import 'package:flutter_application_chuyenman/network/remote/models/get_shopping.dart';
import 'package:flutter_application_chuyenman/network/remote/models/post_shopping_item.dart';
import 'package:flutter_application_chuyenman/network/remote/models/shopping_item.dart';
import 'package:flutter_application_chuyenman/network/data_state/data_state.dart';
import 'package:flutter_application_chuyenman/network/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<DataState<GetShoppingListItemResponse>> getListShoppingItem() async {
    final response = await HomeApi().getListShoppingItem();
    if (response.responseCode == 200) {
      return DataSuccess(data: response);
    } else {
      return DataFailed(data: response);
    }
  }

  @override
  Future<DataState<PostShoppingListItemResponse>> postListShoppingItem(
      ShoppingItem item) async {
    final response = await HomeApi().postListShoppingItem(item);
    if (response.responseCode == 200) {
      return DataSuccess(data: response);
    } else {
      return DataFailed(data: response);
    }
  }

  @override
  Future<DataState<GetCategoryListItemResponse>> getListCategoryItem() async {
    final response = await HomeApi().getListCategoryItem();
    if (response.responseCode == 200) {
      return DataSuccess(data: response);
    } else {
      return DataFailed(data: response);
    }
  }
}
