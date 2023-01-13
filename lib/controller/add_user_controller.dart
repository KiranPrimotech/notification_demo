import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/add_user_model.dart';
class AddUserController extends GetxController{

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  // Add user API
  Future<void> addUser() async{

    Map<String,dynamic> body={
      "email":emailController.text.toString(),
      "username":userNameController.text.toString(),
      "password":passController.text.toString(),
      "name":{
        "firstname":nameController.text.toString(),
        "lastname":lastNameController.text.toString()
      },
      "address":{
        "city":cityController.text.toString(),
        "street":streetController.text.toString(),
        "number":3,
        "zipcode":zipCodeController.text.toString(),
        "geolocation":{
          "lat":"-37.3159",
          "long":"81.1496"
        }
      },
      "phone":phoneController.text.toString()
    };

    var response = await http.post(Uri.parse("https://fakestoreapi.com/users"),
        body:json.encode(body)
    );

    print("respsne ----- ${response.body}");
    if(response.statusCode == 200){
      var dataDecode = jsonDecode(response.body);
      var adduserData = AddUserResposneModel.fromJson(dataDecode);
      print("map data ${adduserData.id}");

      Get.snackbar("resposne",response.statusCode.toString() ,snackPosition: SnackPosition.BOTTOM);
     // Get.toNamed(AppPages.productPage);

    }
    else{
      Get.snackbar("error",response.statusCode.toString() );
    }


  }

  // Submit Data Button
  void submitData(){
    if(formKey.currentState!.validate()){
      addUser();

    }
    else{
      Get.snackbar("Message", "Something went Wrong",snackPosition: SnackPosition.BOTTOM);
    }
  }

}