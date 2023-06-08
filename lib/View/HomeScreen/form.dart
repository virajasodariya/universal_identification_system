import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/View/HomeScreen/bottom_bar.dart';
import 'package:universal_identification_system/View/HomeScreen/death_certificate.dart';
import 'package:universal_identification_system/View/HomeScreen/form_page_one.dart';
import 'package:universal_identification_system/View/HomeScreen/form_page_three.dart';
import 'package:universal_identification_system/View/HomeScreen/form_page_two.dart';
import 'package:universal_identification_system/View/Widget/icon_button.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  List formPage = [
    const FormPageOne(),
    const FormPageTwo(),
    const FormPageThree(),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 55.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 37.h,
                  width: 37.w,
                  child: CommonBackButton(
                    onPressed: () {
                      Get.to(() => const BottomBarScreen());
                    },
                  ),
                ),
                Text(
                  "Form",
                  style: FontTextStyle.k00000020W400,
                ),
                selected == 2
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => const DeathCertificate());
                        },
                        child: Container(
                          height: 37.h,
                          width: 37.w,
                          decoration: BoxDecoration(
                            color: PickColor.k00529B,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/print_icon.svg",
                            height: 18.h,
                            width: 20.9.w,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      )
                    : SizedBox(width: 37.w, height: 37.h),
              ],
            ),
            SizedBox(height: 24.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                formPage.length,
                (index) => Container(
                  height: 4.h,
                  width: 123.w,
                  color: selected == index
                      ? PickColor.k00529B
                      : const Color(0xffDBDBDB),
                ),
              ),
            ),
            SizedBox(height: 27.5.h),
            Expanded(
              child: PageView.builder(
                itemCount: formPage.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                controller: Controller.controller,
                onPageChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: formPage[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
