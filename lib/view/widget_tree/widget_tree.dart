import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_chuyenman/common/authentication.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';

import '../login/login.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshopData) {
        if (snapshopData.hasData) {
          return HomeScreen(
              args: ScreenArgument(
            usernameValue: snapshopData.data?.email ?? "",
          ));
        } else {
          return const Login(title: " Dang nhap");
        }
      },
      stream: Auth().authenStateChanges,
    );
  }
}
