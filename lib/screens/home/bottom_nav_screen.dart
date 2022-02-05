import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:near_era/data/controllers/location_controller.dart';

import '../profile/profile.dart';
import '../menu/menu_screen.dart';
import '../home/home_screen.dart';
import '../../utils/const_color.dart';
import '../explore/explore_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final locationController = Get.put(LocationController());

  final List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    MenuScreen(),
    ProfileScreen(),
  ];

  int pageIndex = 0;

  void selectPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: selectPage,
        currentIndex: pageIndex,
        showSelectedLabels: false,
        selectedItemColor: kSecondaryColor,
        selectedIconTheme: const IconThemeData(color: kPrimaryColor),
        unselectedIconTheme: const IconThemeData(color: kSecondaryColor),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/map.svg',
              fit: BoxFit.contain,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/explore.svg',
              fit: BoxFit.contain,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              fit: BoxFit.contain,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              fit: BoxFit.contain,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
