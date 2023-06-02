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

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
                      Get.to(() => const VerifyingNumberScreen());
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      size: 23.sp,
                    ),
                  ),
                  Text(
                    "New Password",
                    style: FontTextStyle.kBlack15PolyW500,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 2.h, bottom: 3.5.h),
              child: Text(
                "Set your new password",
                style: FontTextStyle.kCloudyGrey14PolyW500,
              ),
            ),
            Center(
              child: CommonTextFormField(
                hintText: "Enter your password",
                controller: VariableController.passwordController,
                validator: (value) {
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 1.5.h),
            Center(
              child: CommonTextFormField(
                hintText: "Enter your confirm password",
                controller: VariableController.passwordController,
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
                  Get.to(() => const LoginScreen());
                },
                text: "Set Password",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
