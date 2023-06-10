import 'package:flutter_application_chuyenman/network/local/models/shopping_item.dart';

class GetShoppingListItemResponse {
  final List<ShoppingItem> listShoppingItem;
  final int responseCode;
  GetShoppingListItemResponse({
    required this.listShoppingItem,
    required this.responseCode,
  });
}
