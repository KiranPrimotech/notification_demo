// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDL6y4uj8T5Dggv25gdGve3HFHqBwYHI_Q',
    appId: '1:673998289049:web:ddb2630918e4bd8b9da008',
    messagingSenderId: '673998289049',
    projectId: 'notificationdemo-cc5ae',
    authDomain: 'notificationdemo-cc5ae.firebaseapp.com',
    databaseURL: 'https://notificationdemo-cc5ae-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notificationdemo-cc5ae.appspot.com',
    measurementId: 'G-ZWTDCXBFHP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtoXyh31r3PXmXT1lLOkuiJIVsNBlF7z0',
    appId: '1:673998289049:android:c8a0472e4bfc30a19da008',
    messagingSenderId: '673998289049',
    projectId: 'notificationdemo-cc5ae',
    databaseURL: 'https://notificationdemo-cc5ae-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notificationdemo-cc5ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA91-aegrtk4HovcvFZkhjSi8rfgbwzf8c',
    appId: '1:673998289049:ios:3fc94481605f53aa9da008',
    messagingSenderId: '673998289049',
    projectId: 'notificationdemo-cc5ae',
    databaseURL: 'https://notificationdemo-cc5ae-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'notificationdemo-cc5ae.appspot.com',
    androidClientId: '673998289049-0df796fl0oh73ov0p2j9j2fr9bb5c609.apps.googleusercontent.com',
    iosClientId: '673998289049-d8mca9o113do3mbu79r9vsueudbkfgsc.apps.googleusercontent.com',
    iosBundleId: 'notification.com.notificationDemo',
  );
}