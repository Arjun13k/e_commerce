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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDJs4KT7iqBt-x3P-bKWRBuhr5z-yyEk-A',
    appId: '1:580510965392:web:dcca19739a568a3a1f4215',
    messagingSenderId: '580510965392',
    projectId: 'fakeapiecommerce',
    authDomain: 'fakeapiecommerce.firebaseapp.com',
    storageBucket: 'fakeapiecommerce.appspot.com',
    measurementId: 'G-YNERCLPGR0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqFs_W22owrdx-PNVrGIC3EBOzdrNmbK0',
    appId: '1:580510965392:android:99b1e40de20848e41f4215',
    messagingSenderId: '580510965392',
    projectId: 'fakeapiecommerce',
    storageBucket: 'fakeapiecommerce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvyRxJnNhO5JdaWxxLSzYFPiG8ugM3dA0',
    appId: '1:580510965392:ios:7fe4a9724b41f5e11f4215',
    messagingSenderId: '580510965392',
    projectId: 'fakeapiecommerce',
    storageBucket: 'fakeapiecommerce.appspot.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvyRxJnNhO5JdaWxxLSzYFPiG8ugM3dA0',
    appId: '1:580510965392:ios:7fe4a9724b41f5e11f4215',
    messagingSenderId: '580510965392',
    projectId: 'fakeapiecommerce',
    storageBucket: 'fakeapiecommerce.appspot.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDJs4KT7iqBt-x3P-bKWRBuhr5z-yyEk-A',
    appId: '1:580510965392:web:248d8a74d1dfb73c1f4215',
    messagingSenderId: '580510965392',
    projectId: 'fakeapiecommerce',
    authDomain: 'fakeapiecommerce.firebaseapp.com',
    storageBucket: 'fakeapiecommerce.appspot.com',
    measurementId: 'G-32KPW7350B',
  );

}