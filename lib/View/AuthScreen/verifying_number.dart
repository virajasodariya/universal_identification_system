import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/View/AuthScreen/forgot_password.dart';
import 'package:universal_identification_system/View/AuthScreen/new_password.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/icon_button.dart';
import 'package:universal_identification_system/View/Widget/text_button.dart';

class VerifyingNumberScreen extends StatefulWidget {
  const VerifyingNumberScreen({Key? key}) : super(key: key);

  @override
  State<VerifyingNumberScreen> createState() => _VerifyingNumberScreenState();
}

class _VerifyingNumberScreenState extends State<VerifyingNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        leading: CommonBackButton(
          onPressed: () {
            Get.offAll(() => const ForgotPasswordScreen(),
                transition: Transition.zoom);
          },
        ),
        title: Text(
          "Verifying Number",
          style: FontTextStyle.k00000020W400,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 37.h),
              Text(
                "We sent an otp to your mobile number\n"
                "${Controller.mobileNumberForgotPassword.text}",
                style: FontTextStyle.k68686820W400,
              ),
              SizedBox(height: 27.h),
              buildOtpPinput(),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not yet get?",
                    style: FontTextStyle.k18122C14W300,
                  ),
                  CommonTextButton(
                    onPressed: () {},
                    text: "Resend OTP",
                  ),
                ],
              ),
              SizedBox(height: 98.h),
              CommonElevatedButton(
                onPressed: () {
                  Get.offAll(() => const NewPasswordScreen(),
                      transition: Transition.zoom);
                },
                text: "Verify",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center buildOtpPinput() {
    return Center(
      child: Pinput(
        length: 6,
        showCursor: true,
        defaultPinTheme: PinTheme(
          width: 54.w,
          height: 76.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
