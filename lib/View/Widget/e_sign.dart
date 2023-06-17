import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hand_signature/signature.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';

class ESign {
  static Future<dynamic> generalDialog() {
    return Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        final control = HandSignatureControl(
          threshold: 3.0,
          smoothRatio: 0.65,
          velocityRange: 2.0,
        );
        return Dialog(
          child: Container(
            height: 356.h,
            width: 311.w,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 26.h),
                Container(
                  height: 177.h,
                  width: 271.w,
                  decoration: BoxDecoration(
                    color: PickColor.kBCA07D,
                    borderRadius: BorderRadius.circular(2.h),
                    border: Border.all(
                      color: const Color(0xffF0F0F0),
                      width: 0.2.h,
                    ),
                  ),
                  child: HandSignature(
                    control: control,
                    color: PickColor.k00529B,
                    // strokeWidth: 1.0,
                    // maxStrokeWidth: 10.0,
                    width: 1.0,
                    maxWidth: 10.0,
                    type: SignatureDrawType.shape,
                  ),
                ),
                SizedBox(height: 27.h),
                CommonElevatedSmallButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: "Save",
                ),
                SizedBox(height: 10.h),
                elevatedButtonSmall(
                  () {
                    control.clear();
                  },
                  "Redo",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static ElevatedButton elevatedButtonSmall(
      VoidCallback onPressed, String text) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(Size(79.sp, 35.sp)),
        shadowColor: MaterialStateProperty.all(Colors.grey),
      ),
      child: Text(
        text,
        style: FontTextStyle.k00529B14W400,
      ),
    );
  }
}
