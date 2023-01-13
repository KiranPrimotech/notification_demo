import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:notification_demo/util/app_routes.dart';

import 'firebase_options.dart';


 const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  //  'This channel is used for important notifications.', // description
  importance: Importance.max,
   playSound: true
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

 Future main() async {
   WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   FirebaseMessaging.onBackgroundMessage(_messageHandler);

   await flutterLocalNotificationsPlugin
       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
       ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    badge: true,
    alert: true,
    sound: true
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     initialRoute: AppRoutes.initialRoute,
     getPages: AppRoutes.routes,
     // home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


