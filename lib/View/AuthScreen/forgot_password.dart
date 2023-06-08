import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/View/AuthScreen/login_screen.dart';
import 'package:universal_identification_system/View/AuthScreen/verifying_number.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/icon_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        leading: CommonBackButton(
          onPressed: () {
            Get.to(() => const LoginScreen());
          },
        ),
        title: Text(
          "Forgot Password",
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
                "Enter your email or phone number &\n"
                "will send you instruction on hoe to reset\n"
                "it.\n"
                "",
                style: FontTextStyle.k68686820W400,
              ),
              SizedBox(height: 8.h),
              Text(
                "Email",
                style: FontTextStyle.k31313116W400,
              ),
              SizedBox(height: 12.h),
              CommonTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter your email",
                controller: Controller.emailForgotPassword,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 28.h),
              Center(
                child: Text(
                  "or",
                  style: FontTextStyle.k67676716W400,
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                "Mobile Number",
                style: FontTextStyle.k31313116W400,
              ),
              SizedBox(height: 12.h),
              CommonTextFormField(
                keyboardType: TextInputType.number,
                hintText: "Enter your mobile number",
                controller: Controller.mobileNumberForgotPassword,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: 75.h),
              CommonElevatedButton(
                onPressed: () {
                  Get.to(() => const VerifyingNumberScreen());
                },
                text: "Sent",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
