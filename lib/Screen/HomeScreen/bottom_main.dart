import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:universal_identification_system/Constants/color_helper.dart';
import 'package:universal_identification_system/Screen/HomeScreen/history.dart';
import 'package:universal_identification_system/Screen/HomeScreen/home.dart';
import 'package:universal_identification_system/Screen/HomeScreen/notifications.dart';
import 'package:universal_identification_system/Screen/HomeScreen/profile.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({Key? key}) : super(key: key);

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  List screen = [
    const HomeScreen(),
    const NotificationsScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: screen[_currentIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        selectedItemColor: ColorHelper.kMediumElectricBlue,
        unselectedItemColor: const Color(0xffD9BB97),
        currentIndex: _currentIndex,
        onTap: (value) => setState(
          () => _currentIndex = value,
        ),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text("Home"),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Likes"),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}
