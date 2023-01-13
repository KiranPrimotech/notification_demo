
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notification_demo/util/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/data_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseMessaging messaging;
  late TextEditingController idController;

  late TextEditingController nameController;

  late var token = "";
  int _counter = 0;
  late var database;
  var connectivityResult;
  /// Firebase analytic
  late FirebaseAnalytics analytics;

  String _message = '';

  void setMessage(String message) {
    setState(() {
      _message = message;
      print("message ----- " + _message);
    });
  }

  Future<void> getUserList() async{


  }
  @override
  void initState() {
    super.initState();

    idController = TextEditingController();
    nameController = TextEditingController();
    toCheckInternet();
  }

  toCheckInternet() async {
     connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile) {
      Get.snackbar(
       " Internet connection is from Mobile data",
        "Display the message here",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );
      print("Internet connection is from Mobile data");
    }else if(connectivityResult == ConnectivityResult.wifi) {
      Get.snackbar(
        " Internet connection is from wifi ",
        "Display the message here",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );
      print("internet connection is from wifi");
    }else if(connectivityResult == ConnectivityResult.ethernet){

      Get.snackbar(
        " Internet connection is from wired cable ",
        "Display the message here",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );
      print("internet connection is from wired cable");
    }else if(connectivityResult == ConnectivityResult.bluetooth){
      Get.snackbar(
        " Internet connection is from wired cable ",
        "Display the message here",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );
      print("internet connection is from bluethooth threatening");
    }else if(connectivityResult == ConnectivityResult.none){
      Get.snackbar(
        "No internet connection ",
        "Display the message here",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
      print("No internet connection");
    }
    setState(() {

    });

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextFormField(
            //   controller: idController,
            //   decoration: const InputDecoration(
            //     hintText: "Add User ID",
            //   ),
            // ).px(20).py(10),

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Add User Name",
              ),
            ).px(20).py(10),
            ElevatedButton(
                onPressed: () async {

                  print("id ---- ${ nameController.text.toString()}");

                }, child: const Text("Submit")).p(10),
            ElevatedButton(
                    onPressed: () async {
                      // Create a Dog and add it to the dogs table
                      var user = const userData(
                        id: 0,
                        name: 'kiran',
                        age: 35,
                      );
                      // insertUser(user);
                    },
                    child: const Text("add user "))
                .p(10),

            "${connectivityResult}".text.make().centered()
         
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppPages.productPage);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
