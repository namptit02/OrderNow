// import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/framework.dart';
// // import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_application_chuyenman/common/authentication.dart';
// import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';

// import '../login/login.dart';

// class WidgetTree extends StatelessWidget {
//   const WidgetTree({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       builder: (context, snapshopData) {
//         if (snapshopData.hasData) {
//           return HomeScreen(
//               args: ScreenArgument(
//             usernameValue: snapshopData.data?.email ?? "",
//           ));
//         } else {
//           return const Login();
//         }
//       },
//       stream: Auth().authenStateChanges,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/common/authentication.dart';
import 'package:flutter_application_chuyenman/view/admin/admin_screen.dart';
import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
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
          if (username == "user22") {
            return const AdminScreen();
          } else {
            return HomeScreen(
              args: ScreenArgument(
                usernameValue: username,
              ),
            );
          }
        } else {
          return const Login();
        }
      },
      stream: Auth().authenStateChanges,
    );
  }
}
