import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';

class CartCubit extends Cubit<List<CartItem>> {
  int totalPrice = 0;

  CartCubit() : super([]);

  void addToCart(CartItem item) {
    List<CartItem> updatedItems = [...state];

    int existingIndex =
        updatedItems.indexWhere((cartItem) => cartItem.idCart == item.idCart);

    if (existingIndex != -1) {
      CartItem existingItem = updatedItems[existingIndex];
      int updatedQuantity = existingItem.quantityCart + 1;

      List<CartItem> updatedItemsCopy = List.from(updatedItems);
      updatedItemsCopy[existingIndex] =
          existingItem.copyWith(quantityCart: updatedQuantity);

      emit(updatedItemsCopy);
    } else {
      updatedItems.add(item);
      emit(updatedItems);
    }

    // Cập nhật tổng giá
    updateTotalPrice();
  }

  void removeFromCart(CartItem item) {
    emit([...state]..remove(item));

    // Cập nhật tổng giá
    updateTotalPrice();
  }

  void updateQuantity(CartItem item, int quantity) {
    List<CartItem> updatedItems = state
        .map((e) => e == item ? item.copyWith(quantityCart: quantity) : e)
        .toList();
    emit(updatedItems);

    // Cập nhật tổng giá
    updateTotalPrice();
  }

  void removeAllItems() {
    emit([]);
  }

  void updateTotalPrice() {
    totalPrice = 0;
    for (final cartItem in state) {
      totalPrice += cartItem.priceCart * cartItem.quantityCart;
    }
  }
}
