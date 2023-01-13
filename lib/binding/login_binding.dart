import 'package:get/get.dart';
import 'package:notification_demo/controller/login_controller.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}