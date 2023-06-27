// To parse this JSON data, do
//
//     final foodCategoryItem = foodCategoryItemFromJson(jsonString);

import 'dart:convert' show json;

FoodCategoryItem foodCategoryItemFromJson(String str) =>
    FoodCategoryItem.fromJson(json.decode(str));

String foodCategoryItemToJson(FoodCategoryItem data) =>
    json.encode(data.toJson());

class FoodCategoryItem {
  final String imageCategory;
  final int priceCategory;
  final String textCategory;
  final String type;
  final String store;

  FoodCategoryItem(
      {required this.imageCategory,
      required this.priceCategory,
      required this.textCategory,
      required this.type,
      required this.store});

  FoodCategoryItem copyWith(
          {String? imageCategory,
          int? priceCategory,
          String? textCategory,
          String? type,
          String? store}) =>
      FoodCategoryItem(
          imageCategory: imageCategory ?? this.imageCategory,
          priceCategory: priceCategory ?? this.priceCategory,
          textCategory: textCategory ?? this.textCategory,
          type: type ?? this.type,
          store: store ?? this.store);

  factory FoodCategoryItem.fromJson(Map<String, dynamic> json) =>
      FoodCategoryItem(
          imageCategory: json["image_category"],
          priceCategory: json["price_category"],
          textCategory: json["text_category"],
          type: json["type"],
          store: json["store"]);

  Map<String, dynamic> toJson() => {
        "image_category": imageCategory,
        "price_category": priceCategory,
        "text_category": textCategory,
        "type": type,
        "store": store
      };
}
