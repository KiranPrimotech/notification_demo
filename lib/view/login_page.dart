import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:notification_demo/controller/login_controller.dart';
import 'package:notification_demo/util/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: "Login Page ".text.make(),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                print("cliked -----------");
                if (kIsWeb) {
                  // running on the web!
                  User? user = await controller.signInWithGoogleWeb();
                  Get.toNamed(AppPages.detailPage, arguments: [user]);
                } else {
                  User? user = await controller.signInWithGoogle();
                  Get.toNamed(AppPages.detailPage, arguments: [user]);                }

              },
              child: const Text("Google Login"),
            ).p(20),
            ElevatedButton(
              onPressed: ()  {
                controller.showNotification();
                // User? user = await controller.signInWithFacebook();
                // Get.toNamed(AppPages.detailPage, arguments: [user]);

                //Get.toNamed(AppPages.secondPage);
              },
              child: const Text("Facebook Login"),
            ).p(20),
            ElevatedButton(
              onPressed: () async {

                    controller.webNotification();

              },
              child: const Text("Generate Token"),
            ).p(20),
          ],
        ),
      ),
    );
  }
}
