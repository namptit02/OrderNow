import 'dart:convert';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class CartItem {

//   final String image;
//   final String text;
//   final int price;
//   final int quantity;
//   CartItem(
//       {required this.image,
//       required this.text,
//       required this.price,
//       required this.quantity});

//   CartItem copyWith({
//     String? image,
//     String? text,
//     int? price,
//     int? quantity,
//   }) {
//     return CartItem(
//       image: image ?? this.image,
//       text: text ?? this.text,
//       price: price ?? this.price,
//       quantity: quantity ?? this.quantity,
//     );
//   }
// }
// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  final int idCart;
  final String imageCart;
  final String textCart;
  final int priceCart;
  final int quantityCart;

  CartItem({
    required this.idCart,
    required this.imageCart,
    required this.textCart,
    required this.priceCart,
    required this.quantityCart,
  });

  CartItem copyWith({
    int? idCart,
    String? imageCart,
    String? textCart,
    int? priceCart,
    int? quantityCart,
  }) {
    return CartItem(
      idCart: idCart ?? this.idCart,
      imageCart: imageCart ?? this.imageCart,
      textCart: textCart ?? this.textCart,
      priceCart: priceCart ?? this.priceCart,
      quantityCart: quantityCart ?? this.quantityCart,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCart': idCart,
      'imageCart': imageCart,
      'textCart': textCart,
      'priceCart': priceCart,
      'quantityCart': quantityCart,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      idCart: map['idCart'] as int,
      imageCart: map['imageCart'] as String,
      textCart: map['textCart'] as String,
      priceCart: map['priceCart'] as int,
      quantityCart: map['quantityCart'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
