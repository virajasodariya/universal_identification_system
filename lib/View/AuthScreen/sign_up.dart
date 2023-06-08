import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Model/Response/sign_up_response_model.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/View/AuthScreen/login_screen.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';
import 'package:universal_identification_system/ViewModel/sign_up_viewmodel.dart';

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
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return 'Please enter a value';
                    // }
                    return null;
                  },
                ),
                SizedBox(height: 19.h),
                CommonTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter your email",
                  controller: signUpViewModel.emailSignUp,
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return 'Please enter a value';
                    // }
                    return null;
                  },
                ),
                SizedBox(height: 19.h),
                CommonTextFormField(
                  keyboardType: TextInputType.number,
                  hintText: "Enter your password",
                  controller: signUpViewModel.passwordSignUp,
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return 'Please enter a value';
                    // }
                    return null;
                  },
                ),
                SizedBox(height: 19.h),
                CommonTextFormField(
                  keyboardType: TextInputType.number,
                  hintText: "Enter your confirm password",
                  controller: signUpViewModel.confirmPasswordSignUp,
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return 'Please enter a value';
                    // }
                    return null;
                  },
                ),
                SizedBox(height: 50.h),
                GetBuilder<SignUpViewModel>(
                  builder: (controller) {
                    if (controller.apiResponse.status == Status.INITIAL ||
                        controller.apiResponse.status == Status.COMPLETE ||
                        controller.apiResponse.status == Status.ERROR) {
                      return CommonElevatedButton(
                        onPressed: () async {
                          // if (formKey.currentState!.validate()) {

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
                              if (data.data.status == "pending") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('${data.message}')));
                                buildGeneralDialog();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('${data.message}')));

                                ///get storage add userid
                                ///navigate to home
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${data.message}')));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${data.message}')));
                            }
                          }

                          // }
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
                        Get.to(() => const LoginScreen());
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

  Future<dynamic> buildGeneralDialog() {
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
                    Get.to(() => const LoginScreen());
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
