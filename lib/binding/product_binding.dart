import 'package:get/get.dart';
import 'package:notification_demo/controller/product_list_controller.dart';

class ProductListBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}