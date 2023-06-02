import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/color_helper.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/variable.dart';
import 'package:universal_identification_system/Screen/HomeScreen/death_certificate.dart';
import 'package:universal_identification_system/Screen/HomeScreen/form_page_one.dart';
import 'package:universal_identification_system/Screen/HomeScreen/form_page_two.dart';
import 'package:universal_identification_system/Screen/HomeScreen/form_page_three.dart';

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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.h, right: 5.w, left: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    CupertinoIcons.back,
                    size: 23.sp,
                  ),
                ),
                Text(
                  "Form",
                  style: FontTextStyle.kBlack15PolyW500,
                ),
                selected == 2
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => const DeathCertificate());
                        },
                        child: Container(
                          height: 4.5.h,
                          width: 4.5.h,
                          decoration: BoxDecoration(
                            color: ColorHelper.kMediumElectricBlue,
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/print_icon.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      )
                    : SizedBox(width: 25.sp),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 1.h, bottom: 3.h, right: 5.w, left: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => Container(
                  height: 0.35.h,
                  width: 28.w,
                  color: selected == index
                      ? ColorHelper.kMediumElectricBlue
                      : ColorHelper.kBattleshipGrey,
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              controller: VariableController.controller,
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
    );
  }
}
