import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Controller/selection.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/View/Widget/elevated_button.dart';
import 'package:universal_identification_system/View/Widget/text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SelectionController selection = Get.put(SelectionController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectionController>(
      builder: (controller) {
        return Column(
          children: [
            SizedBox(height: 24.5.h),
            const Divider(
              color: Color(0xffF0F0F0),
              thickness: 2,
            ),
            SizedBox(height: 24.5.h),
            Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Container(
                  height: 104.h,
                  width: 104.h,
                  decoration: const BoxDecoration(
                    color: PickColor.kBCA07D,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  right: 3,
                  bottom: 3,
                  child: Container(
                    height: 34.h,
                    width: 34.h,
                    decoration: const BoxDecoration(
                      color: PickColor.k00529B,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/pen_icon.svg",
                      height: 13.69.h,
                      width: 13.71.w,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 53.h),
                  CommonTextFormField(
                    keyboardType: TextInputType.name,
                    controller: Controller.nameProfile,
                    hintText: "Enter your name",
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: 19.h),
                  CommonTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: Controller.emailProfile,
                    hintText: "Enter your email",
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: 19.h),
                  CommonTextFormField(
                    keyboardType: TextInputType.number,
                    controller: Controller.phoneNumberProfile,
                    hintText: "Enter your Phone Number",
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: 19.h),
                  CommonTextFormField(
                    keyboardType: TextInputType.url,
                    controller: Controller.locationProfile,
                    hintText: "Enter your Location",
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: 117.h),
                ],
              ),
            ),
            CommonElevatedButton(
              onPressed: () {},
              text: "Save",
            ),
          ],
        );
      },
    );
  }
}
