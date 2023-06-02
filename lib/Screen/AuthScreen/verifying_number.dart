import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/AuthScreen/forgot_password.dart';
import 'package:universal_identification_system/Screen/AuthScreen/new_password.dart';
import 'package:universal_identification_system/Screen/Widget/elevated_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyingNumberScreen extends StatefulWidget {
  const VerifyingNumberScreen({Key? key}) : super(key: key);

  @override
  State<VerifyingNumberScreen> createState() => _VerifyingNumberScreenState();
}

class _VerifyingNumberScreenState extends State<VerifyingNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(() => const ForgotPasswordScreen());
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      size: 23.sp,
                    ),
                  ),
                  Text(
                    "Verifying Number",
                    style: FontTextStyle.kBlack15PolyW500,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 2.h, bottom: 3.h),
              child: Text(
                "We sent an otp to your mobile number\n"
                "${TextEditingControllerVariable.mobileNumberController.text}",
                style: FontTextStyle.kCloudyGrey14PolyW500,
              ),
            ),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 10.w,
              style: TextStyle(fontSize: 15.sp),
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                log("Completed: $pin");
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h, bottom: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not yet get?",
                    style: FontTextStyle.kBlack12PolyW500,
                  ),
                  CommonTextButton(
                    onPressed: () {},
                    text: "Resend OTP",
                  ),
                ],
              ),
            ),
            Center(
              child: CommonElevatedButton(
                onPressed: () {
                  Get.to(() => const NewPasswordScreen());
                },
                text: "Verify",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
