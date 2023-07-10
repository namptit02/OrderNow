import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/common/authentication.dart';
import 'package:flutter_application_chuyenman/view/admin/admin_screen.dart';
// import 'package:flutter_application_chuyenman/view/bottomnavbar/bottomnavbar.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:flutter_application_chuyenman/view/map/map_screen.dart';

// import 'package:flutter_application_chuyenman/view/adminscreen/admin_screen.dart';

import '../login/login.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshotData) {
        if (snapshotData.hasData) {
          final username = snapshotData.data?.email ?? "";
          if (username == "admin@gmail.com") {
            return const AdminScreen();
          } else if (snapshotData.hasData) {
            return MapScreen(
              phoneNumber: '',
              userName: '',
            );
            // return const BottomNavBar();
          } else {
            return const HomeScreen(
              phoneNumber: '',
              userName: '',
              current_address: '',
            );
          }
        } else {
          return const LoginScreen();
        }
      },
      stream: Auth().authenStateChanges,
    );
  }
}
