import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:flutter_application_chuyenman/view/login/login.dart';
import 'package:flutter_application_chuyenman/view/splash_screen/splash_scrren.dart';
import 'package:flutter_application_chuyenman/view/widget_tree/widget_tree.dart';

class AppRouter {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case AppRouteName.widegetTree:
        return MaterialPageRoute(
          builder: (context) => const WidgetTree(),
          settings: settings,
        );
      case AppRouteName.login:
        return MaterialPageRoute(
          builder: (context) => const Login(title: "dang nhap "),
          settings: settings,
        );
      case AppRouteName.home_screen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            args: settings.arguments as ScreenArgument,
          ),
          // args: settings.arguments as ScreenArgument,
          settings: settings,
        );
    }
    return null;
  }

  static onGeneratedRoutesettings() {}
}

class AppRouteName {
  static const splash = "/splash";
  static const widegetTree = "/widget_tree";
  static const login = "/login";
  // ignore: constant_identifier_names
  static const home_screen = "/home_screen";
}