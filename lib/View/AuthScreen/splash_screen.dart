import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/View/AuthScreen/login_screen.dart';
import 'package:universal_identification_system/View/HomeScreen/bottom_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(
          () => box.read("userId") == null
              ? const LoginScreen()
              : const BottomBarScreen(),
          transition: Transition.zoom,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 341.w,
          height: 178.h,
          child: UisLogoImage.uisLogoImage(),
        ),
      ),
    );
  }
}
