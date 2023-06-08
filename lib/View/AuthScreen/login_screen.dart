import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/View/AuthScreen/forgot_password.dart';
import 'package:universal_identification_system/View/AuthScreen/sign_up.dart';
import 'package:universal_identification_system/View/HomeScreen/bottom_bar.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 118.h),
              SizedBox(
                width: 322.w,
                height: 168.h,
                child: UisLogoImage.uisLogoImage(),
              ),
              SizedBox(height: 56.h),
              Text(
                "Login",
                style: FontTextStyle.kBCA07D16W400,
              ),
              SizedBox(height: 7.h),
              Text(
                "Welcome back!",
                style: FontTextStyle.k00529B26W400,
              ),
              SizedBox(height: 19.h),
              CommonTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter your email",
                  controller: Controller.emailLogin,
                  validator: (value) {
                    return null;
                  }),
              SizedBox(height: 19.h),
              CommonTextFormField(
                keyboardType: TextInputType.number,
                hintText: "Enter your password",
                controller: Controller.passwordLogin,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 18.h),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const ForgotPasswordScreen());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: FontTextStyle.k84848416W400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36.h),
              CommonElevatedButton(
                onPressed: () {
                  Get.to(() => const BottomBarScreen());
                },
                text: "Login",
              ),
              SizedBox(height: 36.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: FontTextStyle.kA0A0A014W400,
                  ),
                  CommonTextButton(
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    text: "Register Now",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
