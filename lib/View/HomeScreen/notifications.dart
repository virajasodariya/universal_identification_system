import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 31.h),
      child: Column(
        children: List.generate(
          10,
          (index) => Container(
            height: 53.h,
            width: 388.w,
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 7,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: PickColor.k00529B,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the ext\n"
                  "of theext of the",
                  style: FontTextStyle.k95959514W400,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 31.h),
                  child: Text(
                    "2min",
                    style: FontTextStyle.k95959510W400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
