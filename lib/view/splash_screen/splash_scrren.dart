// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
// import 'package:flutter_application_chuyenman/user_data.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;
  @override
  void initState() {
    initSharedPref();
    requestPermission();
    // readJson();
    super.initState();
  }

  SharedPreferences? prefs;
  readJson() async {
    // ignore: unused_local_variable
    final String json = await rootBundle.loadString("assets/data.json");
    // ignore: unused_local_variable
    final String json2 = await rootBundle.loadString("assets/data2.json");
    // UserData(username: "username", password: "password", isMale: "isMale");
    // print(json);
    // final userResponse = UserResponse.fromJson(jsonDecode(json));
    // print(userResponse.data?.partnerData?.username);
    // print(json2);
  }

  void requestPermission() async {
    // ignore: unused_local_variable
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if (await Permission.storage.request().isGranted) {
      initSharedPref();
      // Navigator.pushNamed(context, "/widget_tree");
    }
  }

  void initSharedPref() async {
    // Doi shared prefs nay phai khoi tao xong
    prefs = await SharedPreferences.getInstance();
    final loginData = prefs?.getString("loginData");
    if (loginData == null) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, "/widget_tree");
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamed(
          context,
          "/home_screen",
          arguments: ScreenArgument(
            usernameValue: loginData,
          ),
        );
      });
    }
    // print(loginData);
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/logo.png"), fit: BoxFit.none)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isLoading)
              const CircularProgressIndicator(
                color: Colors.blue,
              )
          ],
        ),
      ),
    );
  }
}
