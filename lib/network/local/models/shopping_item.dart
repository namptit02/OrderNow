// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final shoppingItem = shoppingItemFromJson(jsonString);

import 'dart:convert';

// import 'package:meta/meta.dart';

class ShoppingItem {
  final String? model;
  final String? name;
  final int? price;
  // final String? imageUrl;

  ShoppingItem({
    this.model,
    this.name,
    this.price,
    // this.imageUrl,
  });

  ShoppingItem copyWith({
    String? model,
    String? name,
    int? price,
    // String? imageUrl,
  }) =>
      ShoppingItem(
        model: model ?? this.model,
        name: name ?? this.name,
        price: price ?? this.price,
      );

  factory ShoppingItem.fromRawJson(String str) =>
      ShoppingItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShoppingItem.fromJson(Map<String, dynamic> json) => ShoppingItem(
        model: json["model"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "name": name,
        "price": price,
      };
}
