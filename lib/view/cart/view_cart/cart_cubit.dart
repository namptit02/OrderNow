import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  void addToCart(CartItem item) {
    emit([...state, item]);
  }

  void removeFromCart(CartItem item) {
    emit([...state]..remove(item));
  }

  void updateQuantity(CartItem item, int quantity) {
    List<CartItem> updatedItems = state
        .map((e) => e == item ? item.copyWith(quantity: quantity) : e)
        .toList();
    emit(updatedItems);
  }
}

// class CartItem {
//   final String image;
//   final String text;
//   final double price;
//   int quantity;

//   CartItem({
//     required this.image,
//     required this.text,
//     required this.price,
//     required this.quantity,
//   });

//   CartItem copyWith({
//     String? image,
//     String? text,
//     double? price,
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
