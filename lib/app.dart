import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/router/app_router.dart';
import 'package:flutter_application_chuyenman/themes/theme_cubit.dart';

// import 'package:flutter_application_chuyenman/view/homepage/home_screen.dart';
import 'package:flutter_application_chuyenman/view/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_application_chuyenman/view/splash_screen/splash_scrren.dart';
// import 'package:flutter_application_chuyenman/view/widget_tree/widget_tree.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: MaterialApp(
        initialRoute: AppRouteName.splash,
        onGenerateRoute: AppRouter.onGeneratedRoute,
        home: Login(title: 'Đăng nhập'),
      ),
    );
  }
}
