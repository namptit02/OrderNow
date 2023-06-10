import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/router/app_router.dart';
// import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:flutter_application_chuyenman/view/login/login.dart';
// import 'package:flutter_application_chuyenman/view/splash_screen/splash_scrren.dart';
// import 'package:flutter_application_chuyenman/view/widget_tree/widget_tree.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: AppRouteName.splash,
      onGenerateRoute: AppRouter.onGeneratedRoute,
      home: Login(title: 'Đăng nhập'),
    );
  }
}
