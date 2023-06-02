import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/color_helper.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Screen/HomeScreen/bottom_main.dart';
import 'package:universal_identification_system/Screen/HomeScreen/home.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: 5.h, right: 5.w, left: 2.w, bottom: 1.h),
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
                "Notifications",
                style: FontTextStyle.kBlack15PolyW500,
              ),
              SizedBox(width: 25.sp),
            ],
          ),
        ),
        Column(
          children: List.generate(
            10,
            (index) => Container(
              height: 6.2.h,
              width: 90.w,
              margin: EdgeInsets.symmetric(vertical: 0.5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 0.5.h,
                  ),
                ],
                borderRadius: BorderRadius.circular(0.8.h),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 4.5.h,
                    width: 4.5.h,
                    decoration: BoxDecoration(
                      color: ColorHelper.kMediumElectricBlue,
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/bell_icon.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the ext\n"
                    "of theext of the",
                    style: FontTextStyle.kBattleshipGrey10PolyW500,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.6.h),
                    child: Text(
                      "2min",
                      style: FontTextStyle.kBattleshipGrey10PolyW500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
