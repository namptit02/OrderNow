import 'package:flutter_application_chuyenman/network/local/models/shopping_item.dart';

class PostShoppingListItemResponse {
  final ShoppingItem shoppingItem;
  final int responseCode;
  PostShoppingListItemResponse({
    required this.shoppingItem,
    required this.responseCode,
  });
}
