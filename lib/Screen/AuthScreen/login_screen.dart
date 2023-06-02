import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/Screen/AuthScreen/forgot_password.dart';
import 'package:universal_identification_system/Screen/AuthScreen/sign_up.dart';
import 'package:universal_identification_system/Screen/HomeScreen/bottom_main.dart';
import 'package:universal_identification_system/Screen/Widget/elevated_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UisLogoImage.uisLogoImage(),
                SizedBox(height: 5.h),
                Text(
                  "Login",
                  style: FontTextStyle.kMushroom13PolyW500,
                ),
                Text(
                  "Welcome back!",
                  style: FontTextStyle.kMediumElectricBlue22PolyW500,
                ),
                SizedBox(height: 2.h),
                CommonTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter your email",
                  controller: VariableController.emailController,
                  validator: (value) {
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (value.isEmpty) {
                    } else {}
                  },
                ),
                SizedBox(height: 2.h),
                CommonTextFormField(
                  keyboardType: TextInputType.number,
                  hintText: "Enter your password",
                  controller: VariableController.passwordController,
                  validator: (value) {
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 60.w),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => const ForgotPasswordScreen());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: FontTextStyle.kBattleshipGrey10PolyW500,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                CommonElevatedButton(
                  onPressed: () {
                    Get.to(() => const MainBottomNavScreen());
                  },
                  text: "Login",
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: FontTextStyle.kBattleshipGrey10PolyW500,
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
      ),
    );
  }
}
