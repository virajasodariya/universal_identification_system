import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_identification_system/Constants/color_helper.dart';
import 'package:universal_identification_system/Constants/test_style.dart';
import 'package:universal_identification_system/Screen/HomeScreen/history.dart';
import 'package:universal_identification_system/Screen/HomeScreen/home.dart';
import 'package:universal_identification_system/Screen/HomeScreen/notifications.dart';
import 'package:universal_identification_system/Screen/HomeScreen/profile.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List screen = [
    const HomeScreen(),
    const NotificationsScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: screen[currentIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(3.h)),
        child: SalomonBottomBar(
          backgroundColor: Colors.white,
          selectedItemColor: ColorHelper.kMediumElectricBlue,
          unselectedItemColor: ColorHelper.kMushroom,
          currentIndex: currentIndex,
          onTap: (value) => setState(
            () => currentIndex = value,
          ),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home_icon.svg",
                height: 2.8.h,
                color: currentIndex == 0
                    ? ColorHelper.kMediumElectricBlue
                    : ColorHelper.kMushroom,
              ),
              title: Text(
                "Home",
                style: FontTextStyle.kMediumElectricBlue11PolyW500,
              ),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                "assets/icons/bell_icon.svg",
                height: 2.8.h,
                color: currentIndex == 1
                    ? ColorHelper.kMediumElectricBlue
                    : ColorHelper.kMushroom,
              ),
              title: Text(
                "Notification",
                style: FontTextStyle.kMediumElectricBlue11PolyW500,
              ),
            ),

            /// Search
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                "assets/icons/history_icon.svg",
                height: 2.8.h,
                color: currentIndex == 2
                    ? ColorHelper.kMediumElectricBlue
                    : ColorHelper.kMushroom,
              ),
              title: Text(
                "History",
                style: FontTextStyle.kMediumElectricBlue11PolyW500,
              ),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                "assets/icons/profile_icon.svg",
                height: 2.8.h,
                color: currentIndex == 3
                    ? ColorHelper.kMediumElectricBlue
                    : ColorHelper.kMushroom,
              ),
              title: Text(
                "Profile",
                style: FontTextStyle.kMediumElectricBlue11PolyW500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
