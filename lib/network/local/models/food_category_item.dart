// To parse this JSON data, do
//
//     final foodCategoryItem = foodCategoryItemFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class FoodCategoryItem {
  final String? imageCategory;
  final String? textCategory;

  FoodCategoryItem({
    this.imageCategory,
    this.textCategory,
  });

  FoodCategoryItem copyWith({
    String? imageCategory,
    String? textCategory,
  }) =>
      FoodCategoryItem(
        imageCategory: imageCategory ?? this.imageCategory,
        textCategory: textCategory ?? this.textCategory,
      );

  factory FoodCategoryItem.fromRawJson(String str) =>
      FoodCategoryItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodCategoryItem.fromJson(Map<String, dynamic> json) =>
      FoodCategoryItem(
        imageCategory: json["image_category"],
        textCategory: json["text_category"],
      );

  Map<String, dynamic> toJson() => {
        "image_category": imageCategory,
        "text_category": textCategory,
      };
}
