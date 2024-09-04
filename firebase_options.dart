// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAq77f6Sk5YYajUQCBBps4XOPcDf1faCYQ',
    appId: '1:308936205165:web:5203111c88f798be8df064',
    messagingSenderId: '308936205165',
    projectId: 'edemy-bdbe4',
    authDomain: 'edemy-bdbe4.firebaseapp.com',
    storageBucket: 'edemy-bdbe4.appspot.com',
    measurementId: 'G-668LE4HD1M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9w02WvpR9cEwrc4Hb_vkiUTVU6qBA6mI',
    appId: '1:308936205165:android:7e62239255396eac8df064',
    messagingSenderId: '308936205165',
    projectId: 'edemy-bdbe4',
    storageBucket: 'edemy-bdbe4.appspot.com',
  );
}
