import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Model/Response/sign_up_response_model.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/show_dialog.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/show_toast.dart';
import 'package:universal_identification_system/View/AuthScreen/login_screen.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';
import 'package:universal_identification_system/ViewModel/sign_up_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  SignUpViewModel signUpViewModel = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 97.h),
                SizedBox(
                  width: 302.w,
                  height: 158.h,
                  child: UisLogoImage.uisLogoImage(),
                ),
                SizedBox(height: 34.h),
                Text(
                  "Sign up",
                  style: FontTextStyle.k00529B26W400,
                ),
                SizedBox(height: 34.h),
                CommonTextFormField(
                  keyboardType: TextInputType.name,
                  hintText: "Enter your name",
                  controller: signUpViewModel.nameSignUp,
                ),
                SizedBox(height: 19.h),
                CommonTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter your email",
                  controller: signUpViewModel.emailSignUp,
                ),
                SizedBox(height: 19.h),
                CommonTextFormField(
                  keyboardType: TextInputType.number,
                  hintText: "Enter your password",
                  controller: signUpViewModel.passwordSignUp,
                ),
                SizedBox(height: 19.h),
                CommonTextFormField(
                  keyboardType: TextInputType.number,
                  hintText: "Enter your confirm password",
                  controller: signUpViewModel.confirmPasswordSignUp,
                ),
                SizedBox(height: 50.h),
                GetBuilder<SignUpViewModel>(
                  builder: (controller) {
                    if (controller.apiResponse.status == Status.INITIAL ||
                        controller.apiResponse.status == Status.COMPLETE ||
                        controller.apiResponse.status == Status.ERROR) {
                      return CommonElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await controller.signUpViewModel({
                              "name": signUpViewModel.nameSignUp.text,
                              "email": signUpViewModel.emailSignUp.text,
                              "password": signUpViewModel.passwordSignUp.text,
                              "cpassword":
                                  signUpViewModel.confirmPasswordSignUp.text,
                            });

                            if (controller.apiResponse.status ==
                                Status.COMPLETE) {
                              SignUpResponseModel data =
                                  controller.apiResponse.data;

                              if (data.status == "success") {
                                if (data.status == "pending") {
                                  ShowDialog.showGeneralDialog();
                                } else {
                                  CommonToast.showToast(data.message);
                                }

                                CommonToast.showToast(data.message);
                              } else {
                                CommonToast.showToast(data.message);
                              }
                            }
                          }
                        },
                        text: "Sign up",
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(height: 34.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: FontTextStyle.k84848416W400,
                    ),
                    CommonTextButton(
                      onPressed: () {
                        Get.offAll(() => const LoginScreen(),
                            transition: Transition.zoom);
                      },
                      text: "Login Now",
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
