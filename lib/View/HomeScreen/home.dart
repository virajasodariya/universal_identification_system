import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/View/HomeScreen/form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 33.17.h),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.to(() => const FormScreen());
              },
              child: SizedBox(
                width: 291.67.w,
                height: 291.67.h,
                child: SvgPicture.asset(
                  "assets/images/Vector.svg",
                ),
              ),
            ),
          ),
          SizedBox(height: 31.h),
          Text(
            "Notice",
            style: FontTextStyle.k00000014W400,
          ),
          SizedBox(height: 20.h),
          Column(
            children: List.generate(
              2,
              (index) => Container(
                height: 53.h,
                width: 388.w,
                margin: EdgeInsets.only(bottom: 13.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the",
                    style: FontTextStyle.k95959514W400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
