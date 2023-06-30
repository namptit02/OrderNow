import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_application_chuyenman/view/login/login.dart';
// import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
// import 'package:flutter_application_chuyenman/view/splash_screen/splash_scrren.dart';
// import 'package:flutter_application_chuyenman/view/widget_tree/widget_tree.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// void initFireNotification() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
// }
