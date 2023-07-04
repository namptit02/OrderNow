import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/view/forgotpassword/forgotpassword.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_chuyenman/common/authentication.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  bool isObscured = true;

  LoginCubit()
      : usernameController = TextEditingController(),
        passwordController = TextEditingController(),
        super(LoginInitial());

  Future<void> initSharedPref() async {
    emit(LoginLoading());
    final prefs = await SharedPreferences.getInstance();
    // Kiểm tra thông tin đăng nhập lưu trong SharedPreferences
    final loginData = prefs.getString("loginData");
    if (loginData != null) {
      // Thực hiện các xử lý khi có thông tin đăng nhập đã lưu
      // ...
      emit(LoginSuccess());
    } else {
      emit(LoginInitial());
    }
  }

  Future<void> loginWithEmailAndPassword() async {
    emit(LoginLoading());
    final password = passwordController.text.trim();
    if (password.length < 6) {
      Fluttertoast.showToast(
        msg: "Password must be at least 6 characters long.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      emit(LoginError("Password must be at least 6 characters long."));
      return;
    }

    try {
      await Auth().loginWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: password,
      );
      Fluttertoast.showToast(
        msg: "Logged in successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
      );
      emit(LoginSuccess());
    } catch (error) {
      Fluttertoast.showToast(
        msg: "Incorrect password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
      );
      emit(LoginError("Incorrect password"));
      // print(error.toString());
    }
  }

  void togglePasswordVisibility() {
    isObscured = !isObscured;
    emit(LoginPasswordVisibilityChanged());
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    try {
      await Auth().signInWithGoogle();
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginError("Failed to sign in with Google"));
      // print(error.toString());
    }
  }

  void goToForgotPasswordPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
    );
  }

  void goToSignUpPage(BuildContext context) {
    Navigator.pushNamed(context, "/signup_screen");
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);
}

class LoginPasswordVisibilityChanged extends LoginState {}
