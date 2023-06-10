import 'package:flutter_application_chuyenman/network/local/models/food_category_item.dart';

class GetCategoryListItemResponse {
  final List<FoodCategoryItem> listCategoryItem;
  final int responseCode;

  GetCategoryListItemResponse(
      {required this.listCategoryItem, required this.responseCode});
}
