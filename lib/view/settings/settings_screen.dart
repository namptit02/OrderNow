import 'package:flutter/material.dart';

import 'package:flutter_application_chuyenman/common/authentication.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff8359E3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          onPressed: () async {
            try {
              await Auth().logOut();
              // Xóa thông tin đăng nhập đã lưu trong SharedPreferences
              final prefs = await SharedPreferences.getInstance();
              prefs.remove("loginData");

              // Ngắt kết nối tài khoản Google
              final googleSignIn = GoogleSignIn();
              // await googleSignIn.disconnect();
              await googleSignIn.signOut();
              // Xóa token xác thực của tài khoản Google (nếu có)
            } catch (error) {
              // ignore: avoid_print
              print(error.toString());
            }
          },
          child: const Text(
            "Log out",
          ),
        ),
      ),
    );
  }
}
