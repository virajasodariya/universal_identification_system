import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/View/AuthScreen/login_screen.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';

class ShowDialog {
  static Future<dynamic> showGeneralDialog() {
    return Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          child: Container(
            width: 332.w,
            height: 407.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 276.w, right: 18.w, top: 21.h, bottom: 63.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SizedBox(
                      width: 38.w,
                      height: 38.h,
                      child: SvgPicture.asset(
                        "assets/icons/cancel_icon.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Please wait until\n"
                  "admin approve\n"
                  "your profile ",
                  style: FontTextStyle.k00000026W400,
                ),
                SizedBox(height: 83.h),
                CommonElevatedSmallButton(
                  onPressed: () {
                    Get.offAll(() => const LoginScreen(),
                        transition: Transition.zoom);
                  },
                  text: "OK",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
