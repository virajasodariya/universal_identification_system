import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/Screen/AuthScreen/login_screen.dart';
import 'package:universal_identification_system/Screen/Widget/elevated_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UisLogoImage.uisLogoImage(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: Text(
                  "Sign up",
                  style: FontTextStyle.kMediumElectricBlue22PolyW500,
                ),
              ),
              CommonTextFormField(
                keyboardType: TextInputType.name,
                hintText: "Enter your name",
                controller: Controller.nameSignUp,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 1.5.h),
              CommonTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter your email",
                controller: Controller.emailSignUp,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 1.5.h),
              CommonTextFormField(
                keyboardType: TextInputType.number,
                hintText: "Enter your password",
                controller: Controller.passwordSignUp,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 1.5.h),
              CommonTextFormField(
                keyboardType: TextInputType.number,
                hintText: "Enter your confirm password",
                controller: Controller.confirmPasswordSignUp,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 5.h),
              CommonElevatedButton(
                onPressed: () {
                  buildGeneralDialog();
                },
                text: "Sign up",
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: FontTextStyle.kBattleshipGrey10PolyW500,
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
    );
  }

  Future<dynamic> buildGeneralDialog() {
    return Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 55.w, top: 1.h),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 25.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Text(
                  textAlign: TextAlign.center,
                  "Please wait until\n"
                  "admin approve\n"
                  "your profile ",
                  style: FontTextStyle.kBlack15PolyW500,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: CommonElevatedSmallButton(
                  onPressed: () {
                    Get.to(() => const LoginScreen());
                  },
                  text: "OK",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
