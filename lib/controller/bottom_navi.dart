
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_demo/view/add_user.dart';
import 'package:notification_demo/view/home_page.dart';
import 'package:notification_demo/view/login_page.dart';
import 'package:notification_demo/view/map_screen.dart';
import 'package:notification_demo/view/second_screen.dart';

import '../database/db.dart';

class BottomNaviController extends GetxController{
  DateTime? currentBackPressTime;
  Rx<int> selectedIndex = 0.obs;

  final List<Widget> widgetOptions = <Widget>[
    MyHomePage(title: "Home Page"),
    LoginScreen(),
    MapScreen(),
    SecondPage(),
    AddUserPage(),
  ];

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
  @override
  void onInit() {
   DB().getDataBase();
    super.onInit();
  }



}
