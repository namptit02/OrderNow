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
}