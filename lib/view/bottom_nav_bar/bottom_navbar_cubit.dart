import 'package:bloc/bloc.dart';

enum BottomNavBarState { home, like, cart, profile }

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState.home);

  void selectHome() => emit(BottomNavBarState.home);
  void selectLike() => emit(BottomNavBarState.like);
  void selectCart() => emit(BottomNavBarState.cart);
  void selectProfile() => emit(BottomNavBarState.profile);
}
