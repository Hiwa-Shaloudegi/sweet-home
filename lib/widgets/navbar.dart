import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweet_home/controllers/main_controller.dart';

import '../constants/colors.dart';
import '../my_custom_icon_icons.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  //Controllers
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (mainController) {
      return SizedBox(
        height: 80,
        child: BottomNavigationBar(
          currentIndex: mainController.currentIndex,
          iconSize: 34,
          elevation: 12,
          selectedFontSize: 17,
          unselectedFontSize: 14,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.unselectedItemColor,
          onTap: (value) => mainController.selectTab(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(MyCustomIcon.profile),
              label: 'پروفایل',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyCustomIcon.home, size: 32),
              label: 'خانه',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyCustomIcon.building),
              label: 'آپارتمان',
            ),
          ],
        ),
      );
    });
  }
}
