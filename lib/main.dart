import 'package:firebase_core/firebase_core.dart';
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
