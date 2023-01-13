import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataClass {


  /// set user Id
 static Future<void> _testSetUserId(FirebaseAnalytics analytics) async {
    await analytics.setUserId(id: 'some-user');
  //  setMessage('setUserId succeeded');
  }

 static Future<void> _sendAnalyticsEvent(FirebaseAnalytics analytics) async {
    print("analytics -------- ");
    await analytics.logEvent(
      name: 'test_event',
      parameters: <String, dynamic>{

        'int': 42,
        'long': 12345678910,
        'double': 42.0,
        // Only strings and numbers (ints & doubles) are supported for GA custom event parameters:
        // https://developers.google.com/analytics/devguides/collection/analyticsjs/custom-dims-mets#overview
        // 'bool': true.toString(),
        'items':  [
          AnalyticsEventItem(
              itemName: 'Socks',
              itemId: 'xjw73ndnw',
              price: 10
          ),
        ],
      },
    );
   // setMessage('logEvent succeeded');
  }

  Future<void> setScreenView(FirebaseAnalytics analytics) async{
    await analytics.setCurrentScreen(screenName: "Home Page");
  }

 /// Recieve Notification
 void notification(FirebaseAnalytics analytics, FirebaseMessaging messaging) {

   messaging.getToken().then((value) {
     print("value --- ${value}");
     //token = value!;
   });
   FirebaseMessaging.onMessage.listen((RemoteMessage event) {
     print("message recieved");
     print(event.notification!.body);

   });
   FirebaseMessaging.onMessageOpenedApp.listen((message) {
     print('Message clicked!');
   });
 }


  ///-------------------------FIREBASE-----------------------///

  /// Send Notification API implementation
  Future<bool> callOnFcmApiSendPushNotifications(String userToken) async {

    final postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      //  "registration_ids" : userToken,
      "to":userToken,
      "collapse_key" : "type_a",
      "notification" : {
        "title": 'NewTextTitle',
        "body" : 'NewTextBody',
      }
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization': "key=AAAAnO1tuJk:APA91bEQdSlepytMCHJ2yFUBFiWw-qashD1SJYpMvaJN8_kmXyyCj99SHtXg_UZcVFcFVBl0c4BS0EwIh9WRBrcqWNmhhWz0dTaAcrUa7brSlwN5wLqBMsvPBtsx2mlp41uioTtSXC2_ " // 'key=YOUR_SERVER_KEY'
    };

    final response = await http.post(Uri.parse(postUrl),
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);
    print("response ---- ${response.body}");

    if (response.statusCode == 200) {
      // on success do sth
      print('test ok push CFM');
      return true;
    } else {
      print(' CFM error');
      // on failure do sth
      return false;
    }
  }


  ///----------------- AUTHENTICATION ----------------------///


}