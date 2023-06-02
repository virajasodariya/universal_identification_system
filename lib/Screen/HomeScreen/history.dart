import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/color_helper.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Screen/HomeScreen/bottom_main.dart';
import 'package:universal_identification_system/Screen/HomeScreen/home.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List name = [
    "Jane Cooper",
    "Wade Warren",
    "Esther Howard",
    "Brooklyn Simmons",
    "Jenny Wilson",
    "Guy Hawkins",
    "Albert Flores",
    "Ralph Edwards",
    "Annette Black",
  ];

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
                "History",
                style: FontTextStyle.kBlack15PolyW500,
              ),
              SizedBox(width: 25.sp),
            ],
          ),
        ),
        Column(
          children: List.generate(
            name.length,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name[index],
                          style: FontTextStyle.kBlack12PolyW500,
                        ),
                        Row(
                          children: [
                            Text(
                              "Date of Death: ",
                              style: FontTextStyle.kBattleshipGrey10PolyW500,
                            ),
                            Text(
                              "26-03-2021",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9.5.sp,
                                fontFamily: "Poly",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 3.5.h,
                      width: 23.w,
                      margin: EdgeInsets.symmetric(vertical: 0.5.h),
                      decoration: BoxDecoration(
                        color: ColorHelper.kMediumElectricBlue,
                        borderRadius: BorderRadius.circular(0.8.h),
                      ),
                      child: Center(
                        child: Text(
                          "View Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontFamily: "Poly",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
