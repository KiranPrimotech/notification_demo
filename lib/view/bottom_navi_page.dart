import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_navi.dart';
import 'package:hello/hello.dart';

class BottomNaviPage extends StatelessWidget {
  Calculator calc = Calculator();
  @override
  Widget build(BuildContext context) {

    BottomNaviController _controller = Get.find();

    return Scaffold(
      //  backgroundColor:Colors.white60 ,
      body: WillPopScope(
        onWillPop: _controller.onWillPop,
        child: Obx(
              () => Center(
            child: _controller.widgetOptions
                .elementAt(_controller.selectedIndex.value),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),

        // data: Theme.of(context).copyWith(
        //   canvasColor: Colors.white,
        // ),
        child: Obx(
              () => BottomNavigationBar(
            elevation: 10,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: iconitem(Icons.home),
                activeIcon: activeiconitem(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: iconitem(Icons.shopping_bag_outlined),
                activeIcon: activeiconitem(Icons.shopping_bag_outlined),
                label: 'Stores',
              ),
              BottomNavigationBarItem(
                icon: iconitem(Icons.shield_moon_outlined),
                activeIcon: activeiconitem(Icons.shield_moon_outlined),
                label: 'Insurance',
              ),
              BottomNavigationBarItem(
                icon: iconitem(Icons.currency_rupee),
                activeIcon: activeiconitem(Icons.currency_rupee),
                label: 'Wealth',
              ),
              BottomNavigationBarItem(
                icon: iconitem(Icons.history),
                activeIcon: activeiconitem(Icons.history),
                label: 'History',
              )
            ],
            currentIndex: _controller.selectedIndex.value,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            selectedItemColor: Colors.purple.shade800,
            unselectedItemColor: Colors.grey.shade600,
            type: BottomNavigationBarType.fixed,
            onTap: _controller.onItemTapped,
          ),
        ),
      ),
    );
  }

  Widget iconitem(IconData path) {

    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),

          color: Colors.grey.shade600),

      child: Center(
        child: Icon(
          path,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget activeiconitem(IconData path) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.purple.shade800),
      child: Center(
        child: Icon(
          path,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}