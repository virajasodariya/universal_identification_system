import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/View/AuthScreen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(() => const LoginScreen());
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
