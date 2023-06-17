import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:universal_identification_system/View/AuthScreen/splash_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

          /// email :- amangupta2404@gmail.com
          /// password :- 123456789
          home: const SplashScreen(),
        );
      },
    );
  }
}
