import 'package:flutter_application_chuyenman/themes/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: ThemeMode.primary));
  void changeThemeMode() {
    emit(state.copyWith(
        themeData: state.themeData == ThemeMode.primary
            ? ThemeMode.noel
            : ThemeMode.primary));
  }
}
