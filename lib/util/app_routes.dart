import 'package:get/get.dart';
import 'package:notification_demo/binding/bottom_navi_binding.dart';
import 'package:notification_demo/binding/login_binding.dart';
import 'package:notification_demo/util/app_pages.dart';
import 'package:notification_demo/view/add_user.dart';
import 'package:notification_demo/view/home_page.dart';
import 'package:notification_demo/view/login_page.dart';
import 'package:notification_demo/view/product_list_page.dart';

import '../binding/detail_binding.dart';
import '../binding/product_binding.dart';
import '../view/detail_screen.dart';
import '../view/second_screen.dart';
import '../view/bottom_navi_page.dart';

class AppRoutes {

  static const String initialRoute = AppPages.bottomNavi;
  static final  routes =[
    GetPage(name: AppPages.loginPage, page: () => LoginScreen(),binding: LoginBinding()),
    GetPage(name: AppPages.detailPage, page: () => DetailPage(),binding: DetailBinding()),
    GetPage(name: AppPages.secondPage, page: () => SecondPage(),binding: DetailBinding()),
    GetPage(name: AppPages.bottomNavi, page: () => BottomNaviPage(),binding: BottomNaviBinding()),
    GetPage(name: AppPages.addUser, page: () => AddUserPage(),binding: BottomNaviBinding()),
    GetPage(name: AppPages.productPage, page: () => ProductPage(),binding: ProductListBinding()),
  ];

}