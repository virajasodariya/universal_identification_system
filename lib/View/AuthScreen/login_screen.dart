import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Model/Response/login_response_model.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/show_dialog.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/show_toast.dart';
import 'package:universal_identification_system/View/AuthScreen/forgot_password.dart';
import 'package:universal_identification_system/View/AuthScreen/sign_up.dart';
import 'package:universal_identification_system/View/HomeScreen/bottom_bar.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';
import 'package:universal_identification_system/ViewModel/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  LoginViewModel loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
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
                  controller: loginViewModel.emailLogin,
                ),
                SizedBox(height: 19.h),
                CommonTextFormField(
                  keyboardType: TextInputType.number,
                  hintText: "Enter your password",
                  controller: loginViewModel.passwordLogin,
                ),
                SizedBox(height: 18.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: GestureDetector(
                      onTap: () {
                        Get.offAll(() => const ForgotPasswordScreen(),
                            transition: Transition.zoom);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: FontTextStyle.k84848416W400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36.h),
                GetBuilder<LoginViewModel>(
                  builder: (controller) {
                    if (controller.apiResponse.status == Status.INITIAL ||
                        controller.apiResponse.status == Status.COMPLETE ||
                        controller.apiResponse.status == Status.ERROR) {
                      return CommonElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await controller.loginViewModel({
                              "email": controller.emailLogin.text,
                              "password": controller.passwordLogin.text,
                            });
                            if (controller.apiResponse.status ==
                                Status.COMPLETE) {
                              log("Status.COMPLETE");
                              LoginResponseModel data =
                                  controller.apiResponse.data;

                              if (data.status == "success") {
                                log("success");
                                if (data.status == "pending") {
                                  log("pending");

                                  ShowDialog.showGeneralDialog();
                                } else {
                                  Get.offAll(() => const BottomBarScreen(),
                                      transition: Transition.zoom);
                                }
                              } else {
                                CommonToast.showToast(data.message);
                              }
                            }
                          }
                        },
                        text: "Login",
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(height: 36.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: FontTextStyle.kA0A0A015W400,
                    ),
                    CommonTextButton(
                      onPressed: () {
                        Get.offAll(() => const SignUpScreen(),
                            transition: Transition.zoom);
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
