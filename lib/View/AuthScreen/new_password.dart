import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/View/AuthScreen/login_screen.dart';
import 'package:universal_identification_system/View/AuthScreen/verifying_number.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/icon_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        leading: CommonBackButton(
          onPressed: () {
            Get.offAll(() => const VerifyingNumberScreen(),
                transition: Transition.zoom);
          },
        ),
        title: Text(
          "New Password",
          style: FontTextStyle.k00000020W400,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 37.h),
              Text(
                "Set your new password",
                style: FontTextStyle.k68686820W400,
              ),
              SizedBox(height: 28.h),
              CommonTextFormField(
                keyboardType: TextInputType.number,
                hintText: "Enter your password",
                controller: Controller.passwordNewPassword,
              ),
              SizedBox(height: 19.h),
              CommonTextFormField(
                keyboardType: TextInputType.number,
                hintText: "Enter your confirm password",
                controller: Controller.confirmPasswordNewPassword,
              ),
              SizedBox(height: 103.h),
              CommonElevatedButton(
                onPressed: () {
                  Get.offAll(() => const LoginScreen(),
                      transition: Transition.zoom);
                },
                text: "Set Password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
