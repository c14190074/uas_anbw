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
    apiKey: 'AIzaSyDnVGn9Kiv-vNn_S7XIUhvUIYayV_M3Ok0',
    appId: '1:685551586943:web:2c8c2c5c61fec00652b94a',
    messagingSenderId: '685551586943',
    projectId: 'uas-ambw',
    authDomain: 'uas-ambw.firebaseapp.com',
    storageBucket: 'uas-ambw.appspot.com',
    measurementId: 'G-MF86YZD2TY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3XX7pFruA9jPr3g3U11R5wFKQaUD6tKw',
    appId: '1:685551586943:android:2edc9f9ead5f382452b94a',
    messagingSenderId: '685551586943',
    projectId: 'uas-ambw',
    storageBucket: 'uas-ambw.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANpUTom5sW5Dd36fwRduT02o4VRS9O9Qw',
    appId: '1:685551586943:ios:979796773e0a4bf252b94a',
    messagingSenderId: '685551586943',
    projectId: 'uas-ambw',
    storageBucket: 'uas-ambw.appspot.com',
    iosClientId: '685551586943-i9uap5h6g70tfk99s1leu50199gdvuqp.apps.googleusercontent.com',
    iosBundleId: 'com.example.c14190074',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANpUTom5sW5Dd36fwRduT02o4VRS9O9Qw',
    appId: '1:685551586943:ios:979796773e0a4bf252b94a',
    messagingSenderId: '685551586943',
    projectId: 'uas-ambw',
    storageBucket: 'uas-ambw.appspot.com',
    iosClientId: '685551586943-i9uap5h6g70tfk99s1leu50199gdvuqp.apps.googleusercontent.com',
    iosBundleId: 'com.example.c14190074',
  );
}
