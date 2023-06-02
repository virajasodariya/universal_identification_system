import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Screen/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/Screen/HomeScreen/form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 40.w, left: 40.w, top: 7.h),
          child: UisLogoImage.uisLogoImage(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.w, bottom: 2.h),
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const FormScreen());
          },
          child: Center(
            child: SvgPicture.asset(
              "assets/images/Vector.svg",
              height: 33.h,
              width: 33.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.w, top: 3.h, bottom: 2.h),
          child: Text(
            "Notice",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Poly",
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
        ),
        Column(
          children: List.generate(
            2,
            (index) => Center(
              child: Container(
                height: 6.h,
                width: 90.w,
                margin: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.5.h),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Center(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the",
                      style: FontTextStyle.kBattleshipGrey11PolyW500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
