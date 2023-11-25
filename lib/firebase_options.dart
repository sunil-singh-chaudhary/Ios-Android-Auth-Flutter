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
        return macos;
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
    apiKey: 'AIzaSyBpClaeXgSg3zqChEJuUV6D_TyTQI_1P28',
    appId: '1:469329137852:web:0febce3d7eb194432c80b9',
    messagingSenderId: '469329137852',
    projectId: 'testauthentication-3045a',
    authDomain: 'testauthentication-3045a.firebaseapp.com',
    storageBucket: 'testauthentication-3045a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaEFkSbXkPE6daFQgCXL4auKe0Ko9BrCU',
    appId: '1:469329137852:android:b74da910742943582c80b9',
    messagingSenderId: '469329137852',
    projectId: 'testauthentication-3045a',
    storageBucket: 'testauthentication-3045a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVOSj2PAGJ6lE1K4dULBm9a1yIt6TTZ-0',
    appId: '1:469329137852:ios:bad36d2a12da32972c80b9',
    messagingSenderId: '469329137852',
    projectId: 'testauthentication-3045a',
    storageBucket: 'testauthentication-3045a.appspot.com',
    androidClientId: '469329137852-mga40rqjhlaa3ihjhootbn5t5uif94q9.apps.googleusercontent.com',
    iosClientId: '469329137852-41u2u1brv099ce0g3unfan8uvvl195k0.apps.googleusercontent.com',
    iosBundleId: 'com.example.googleAppleSigninFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVOSj2PAGJ6lE1K4dULBm9a1yIt6TTZ-0',
    appId: '1:469329137852:ios:1c489255e2303f0b2c80b9',
    messagingSenderId: '469329137852',
    projectId: 'testauthentication-3045a',
    storageBucket: 'testauthentication-3045a.appspot.com',
    androidClientId: '469329137852-mga40rqjhlaa3ihjhootbn5t5uif94q9.apps.googleusercontent.com',
    iosClientId: '469329137852-8uhcdjhm81c6ao1upcu4s0v145mvli7s.apps.googleusercontent.com',
    iosBundleId: 'com.example.googleAppleSigninFlutter.RunnerTests',
  );
}