import 'package:get/get.dart';
import 'package:notification_demo/controller/add_user_controller.dart';
import 'package:notification_demo/controller/bottom_navi.dart';
import 'package:notification_demo/controller/login_controller.dart';

import '../controller/map_controller.dart';

class BottomNaviBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNaviController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => MapController());
    Get.lazyPut(() => AddUserController());
  }
}
