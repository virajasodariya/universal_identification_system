import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/AuthScreen/login_screen.dart';
import 'package:universal_identification_system/Screen/AuthScreen/verifying_number.dart';
import 'package:universal_identification_system/Screen/Widget/elevated_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Get.to(() => const LoginScreen());
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      size: 23.sp,
                    ),
                  ),
                  Text(
                    "Forgot Password",
                    style: FontTextStyle.kBlack15PolyW500,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 2.h, bottom: 3.5.h),
              child: Text(
                "Enter your email or phone number &\n"
                "will send you instruction on hoe to reset\n"
                "it.",
                style: FontTextStyle.kCloudyGrey14PolyW500,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, bottom: 1.2.h),
              child: Text(
                "Email",
                style: FontTextStyle.kBlack12PolyW500,
              ),
            ),
            Center(
              child: CommonTextFormField(
                hintText: "Enter your email",
                controller: TextEditingControllerVariable.emailController,
                validator: (value) {
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(
                  "or",
                  style: FontTextStyle.kBattleshipGrey11PolyW500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, bottom: 1.2.h),
              child: Text(
                "Mobile Number",
                style: FontTextStyle.kBlack12PolyW500,
              ),
            ),
            Center(
              child: CommonTextFormField(
                hintText: "Enter your mobile number",
                controller:
                    TextEditingControllerVariable.mobileNumberController,
                validator: (value) {
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: CommonElevatedButton(
                onPressed: () {
                  Get.to(() => const VerifyingNumberScreen());
                },
                text: "Sent",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
