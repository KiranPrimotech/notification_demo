import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_demo/controller/product_list_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductPage extends GetView<ProductController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: "Product".text.make(),
          centerTitle: true,
        ),
        body: Obx(() =>
        controller.listData.isNotEmpty?
        Column(
          children: [
            ListView.builder(
                itemCount: controller.listData.length,
                itemBuilder: (BuildContext context,int index){
                  return listItems(controller.listData,index);
                }).expand()
          ],
        ):Center(child: CircularProgressIndicator(),)
        ),
      ),
    );
  }
  Widget listItems(List list,int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "${list[index].title}".text.bold.make().p(8),
        "${list[index].description}".text.make().p(8),
      ],
    ).p(10);
  }

}