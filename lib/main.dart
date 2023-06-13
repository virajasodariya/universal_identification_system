import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/View/AuthScreen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'UIS',
          theme: ThemeData(
            fontFamily: "Poly",
          ),
          debugShowCheckedModeBanner: false,

          /// email :- 112812062023@gmail.com
          /// password :- 112812062023
          home: const LoginScreen(),
        );
      },
    );
  }
}
