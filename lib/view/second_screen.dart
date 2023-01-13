import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Details Page".text.make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.person,
              size: 80,
            ),
          ).p(20),
          setItemsData("Kiran@gmail.com"),
          setItemsData("kiran"),
          setItemsData("4543445451"),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: "Done".text.make().p(10),
          ).py(20)
        ],
      ),
    );
  }

  Widget setItemsData(String data) {
    return SizedBox(
      width: Get.width,
      child: Card(child: data.text.size(16).make().p(10)),
    ).p(10);
  }
}
