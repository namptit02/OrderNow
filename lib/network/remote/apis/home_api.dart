import 'dart:convert';
import 'package:flutter_application_chuyenman/network/configs/network_constains.dart';
import 'package:flutter_application_chuyenman/network/remote/models/food_category_item.dart';
import 'package:flutter_application_chuyenman/network/remote/models/get_food_category.dart';
import 'package:flutter_application_chuyenman/network/remote/models/get_shopping.dart';
import 'package:flutter_application_chuyenman/network/remote/models/post_shopping_item.dart';
import 'package:flutter_application_chuyenman/network/remote/models/shopping_item.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  Future<GetShoppingListItemResponse> getListShoppingItem() async {
    var request = http.Request(
        'GET', Uri.parse('${NetworkConstanst.baseUrl}/shopping_items.json'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    final data = (await response.stream.bytesToString());
    //decode json(tu string json -> Map<String,dynamic>)
    final dataDecode = (jsonDecode(data) as Map<String, dynamic>);
    List<ShoppingItem> shoppingList = [];
    // print(dataDecode);
    // print(dataDecode.entries.toList());

    for (var item in dataDecode.entries) {
      //decode json -> shoppingitem
      final itemDecode = ShoppingItem.fromJson(item.value);
      //them lai vao mang shoppingList

      shoppingList.add(itemDecode);
    }
    return GetShoppingListItemResponse(
        listShoppingItem: shoppingList, responseCode: response.statusCode);
    // print(shoppingList[0].model);
    // print(jsonEncode(shoppingList));
  }

  Future<PostShoppingListItemResponse> postListShoppingItem(
    ShoppingItem item,
  ) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://fir-project-1724a-default-rtdb.asia-southeast1.firebasedatabase.app/shopping_items.json'));
    request.body = json.encode(item.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return PostShoppingListItemResponse(
        shoppingItem: item, responseCode: response.statusCode);
  }

  Future<GetCategoryListItemResponse> getListCategoryItem() async {
    var request = http.Request(
        'GET', Uri.parse('${NetworkConstanst.baseUrl}/food_items.json'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    final data = (await response.stream.bytesToString());
    //decode json(tu string json -> Map<String,dynamic>)
    final dataDecode = (jsonDecode(data) as Map<String, dynamic>);
    List<FoodCategoryItem> foodCategoryList = [];
    // print(dataDecode);
    // print(dataDecode.entries.toList());

    for (var item in dataDecode.entries) {
      //decode json -> shoppingitem
      final itemDecode = FoodCategoryItem.fromJson(item.value);
      //them lai vao mang shoppingList

      foodCategoryList.add(itemDecode);
    }
    return GetCategoryListItemResponse(
        listCategoryItem: foodCategoryList, responseCode: response.statusCode);
  }
}
