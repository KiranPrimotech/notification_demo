import 'package:get/get.dart';
import 'package:notification_demo/controller/detail_controller.dart';

class DetailBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => DetailController());
  }
}