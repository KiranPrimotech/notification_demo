import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    User data = Get.arguments[0];
    print("Image Url ----  ${data.photoURL}");


    return Scaffold(
      appBar: AppBar(
        title: "Details Page".text.make(),
      ),
      body: Column(
        children: [
          CircleAvatar(radius: 50,
            foregroundImage: NetworkImage("${data.photoURL}"),
          ).p(20),
          setItemsData("${data.email}"),
          setItemsData("${data.displayName}"),
          setItemsData("${data.phoneNumber}"),
          //setItemsData("${data.photoURL}"),

        ],
      ),
    );
  }
  Widget setItemsData(String data){
    return     SizedBox(
      width: Get.width ,
      child: Card(
          child:data.text.size(16).make().p(10)),
    );
  }
}