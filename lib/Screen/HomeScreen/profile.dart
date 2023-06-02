import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/color_helper.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/HomeScreen/bottom_main.dart';
import 'package:universal_identification_system/Screen/Widget/elevated_button.dart';
import 'package:universal_identification_system/Screen/Widget/text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: 6.h, right: 5.w, left: 2.w, bottom: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => const MainBottomNavScreen());
                },
                icon: Icon(
                  CupertinoIcons.back,
                  size: 23.sp,
                ),
              ),
              Text(
                "My Profile",
                style: FontTextStyle.kBlack15PolyW500,
              ),
              SizedBox(width: 25.sp),
            ],
          ),
        ),
        Divider(
          color: const Color(0xffF0F0F0),
          thickness: 0.3.h,
        ),
        SizedBox(height: 1.h),
        Stack(
          children: [
            Container(
              height: 12.h,
              width: 12.h,
              decoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              right: 00.h,
              bottom: 00.h,
              child: Container(
                height: 4.h,
                width: 4.h,
                decoration: BoxDecoration(
                  color: ColorHelper.kMediumElectricBlue,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "assets/icons/pen_icon.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          controller: VariableController.nameController,
          hintText: "Enter your name",
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: VariableController.emailController,
          hintText: "Enter your email",
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.number,
          controller: VariableController.mobileNumberController,
          hintText: "Enter your Phone Number",
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 1.5.h),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          controller: VariableController.nameController,
          hintText: "Enter your Location",
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 12.h),
        CommonElevatedButton(
          onPressed: () {},
          text: "Save",
        ),
      ],
    );
  }
}
