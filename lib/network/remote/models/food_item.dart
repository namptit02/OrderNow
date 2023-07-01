// To parse this JSON data, do
//
//     final foodCategoryItem = foodCategoryItemFromJson(jsonString);

import 'dart:convert' show json;

FoodCategoryItem foodCategoryItemFromJson(String str) =>
    FoodCategoryItem.fromJson(json.decode(str));

String foodCategoryItemToJson(FoodCategoryItem data) =>
    json.encode(data.toJson());

class FoodCategoryItem {
  final int idCategory;
  final String imageCategory;
  final int priceCategory;
  final String textCategory;
  final String type;
  final String store;
  final int quantity;

  FoodCategoryItem(
      {required this.idCategory,
      required this.imageCategory,
      required this.priceCategory,
      required this.textCategory,
      required this.type,
      required this.store,
      required this.quantity});

  FoodCategoryItem copyWith(
          {int? idCategory,
          String? imageCategory,
          int? priceCategory,
          String? textCategory,
          String? type,
          String? store,
          int? quantity}) =>
      FoodCategoryItem(
          idCategory: idCategory ?? this.idCategory,
          imageCategory: imageCategory ?? this.imageCategory,
          priceCategory: priceCategory ?? this.priceCategory,
          textCategory: textCategory ?? this.textCategory,
          type: type ?? this.type,
          store: store ?? this.store,
          quantity: quantity ?? this.quantity);

  factory FoodCategoryItem.fromJson(Map<String, dynamic> json) =>
      FoodCategoryItem(
          idCategory: json["id_category"],
          imageCategory: json["image_category"],
          priceCategory: json["price_category"],
          textCategory: json["text_category"],
          type: json["type"],
          store: json["store"],
          quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {
        "id_category": idCategory,
        "image_category": imageCategory,
        "price_category": priceCategory,
        "text_category": textCategory,
        "type": type,
        "store": store,
        "quantity": quantity,
      };
}
