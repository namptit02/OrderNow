// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  final String image;
  final String text;
  final int price;
  final int quantity;
  CartItem(
      {required this.image,
      required this.text,
      required this.price,
      required this.quantity});

  CartItem copyWith({
    String? image,
    String? text,
    int? price,
    int? quantity,
  }) {
    return CartItem(
      image: image ?? this.image,
      text: text ?? this.text,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
