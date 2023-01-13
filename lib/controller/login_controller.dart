import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main.dart';



// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//
//   print("object");
//   // handle action
// }
class LoginController extends GetxController{


  /// Google Login
  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    User? user = userCredential.user;
    print("User Email --- ${user!.email}");
    return user;

    // Once signed in, return the UserCredential
    //  return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  /// Facebook Login
  Future<User?> signInWithFacebook() async {
    print("User Email ---");
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    User? user = userCredential.user;
    print("User Email --- ${user!.email}");
    // Once signed in, return the UserCredential
    return user;
  }

  /// Web Google Login
  Future<User?> signInWithGoogleWeb() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });

    // Once signed in, return the UserCredential
    UserCredential userCredential  = await FirebaseAuth.instance.signInWithPopup(googleProvider);
    User? user = userCredential.user;
    print("User Email --- ${user!.email}");
    return user;


  }

  /// Generate Token
  Future<void> webNotification() async{
    FirebaseMessaging.instance.getToken().then((value) {
      print("value --- ${value}");
      Get.snackbar("Token", "${value}");
      //token = value!;
    });    // final fcmToken = await FirebaseMessaging.instance.getToken(vapidKey: "BHCwDL8QXBnVAIF9dvTg8LSLXkVa1HsMAll7PRJxWTHvF-cjBzBVFskUaA05-GoToFx5ishh-K7JQfwTLtFotM4");


  }

  /// Web Notification Permission
  Future<void> getPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  @override
  void onInit() {

    super.onInit();
    getPermission();
    messageListener();


  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  /// Web Notification Listener
  void messageListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print("Message Recieved ${notification!.title}");

   

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: "@mipmap/ic_launcher",

                // other properties...
              ),
            ));
      }

      // if (message.notification != null) {
      //   print(
      //       'Message also contained a notification: ${message.notification!.body}');
      //   Get.snackbar("${message.notification!.title}","${message.notification!.body}");
      //
      // }
    });
  }
  showNotification(){
    flutterLocalNotificationsPlugin.show(0, "notification testing ", "description",  NotificationDetails(
      android: AndroidNotificationDetails(
         channel.id,
        channel.name,
        channelDescription: channel.description,
        playSound: true,
        importance: Importance.high,
        color: Colors.yellow,
        icon: "@mipmap/ic_launcher",
      )
    ));
  }
}
