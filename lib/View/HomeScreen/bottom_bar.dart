import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:universal_identification_system/Constants/color.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Controller/selection.dart';
import 'package:universal_identification_system/View/AuthScreen/Widget/image_uis.dart';
import 'package:universal_identification_system/View/HomeScreen/history.dart';
import 'package:universal_identification_system/View/HomeScreen/home.dart';
import 'package:universal_identification_system/View/HomeScreen/notifications.dart';
import 'package:universal_identification_system/View/HomeScreen/profile.dart';
import 'package:universal_identification_system/View/Widget/icon_button.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  SelectionController selection = Get.put(SelectionController());

  List screen = [
    const HomeScreen(),
    const NotificationsScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];
  List titleText = [
    "",
    "Notification",
    "History",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectionController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            centerTitle: true,
            leading: controller.currentIndex == 0
                ? Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 24.h,
                  )
                : CommonBackButton(
                    onPressed: () {
                      selection.bottomBarValue(0);
                    },
                  ),
            title: controller.currentIndex == 0
                ? SizedBox(
                    width: 65.w,
                    height: 34.h,
                    child: UisLogoImage.uisLogoImage(),
                  )
                : Text(
                    titleText[controller.currentIndex],
                    style: FontTextStyle.k00000020W400,
                  ),
          ),
          body: screen[controller.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              child: GNav(
                  selectedIndex: controller.currentIndex,
                  onTabChange: (value) {
                    controller.bottomBarValue(value);
                  },
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: PickColor.k00529B,
                  iconSize: 30.sp,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: const Color(0xffE5EEF5),
                  color: PickColor.kBCA07D,
                  tabs: const [
                    GButton(
                      icon: CupertinoIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.notifications_none_sharp,
                      text: 'Notification',
                    ),
                    GButton(
                      icon: Icons.history,
                      text: 'History',
                    ),
                    GButton(
                      icon: CupertinoIcons.person_circle,
                      text: 'Profile',
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
