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
    apiKey: 'AIzaSyBAjKHhWeK753_hA9q2-5hMSAEj-5wT1pA',
    appId: '1:266439129607:web:ae1a8908a3ebeef704c8a2',
    messagingSenderId: '266439129607',
    projectId: 'plan-project-aa54d',
    authDomain: 'plan-project-aa54d.firebaseapp.com',
    storageBucket: 'plan-project-aa54d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSSmn660wC2ItVOyOtMTTXp0tq3ko0-DE',
    appId: '1:266439129607:android:2c05ed1143e7bcee04c8a2',
    messagingSenderId: '266439129607',
    projectId: 'plan-project-aa54d',
    storageBucket: 'plan-project-aa54d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgk1wnxfDqXkpfTLlE8953tW4NTo18tns',
    appId: '1:266439129607:ios:0470f5b745af77c604c8a2',
    messagingSenderId: '266439129607',
    projectId: 'plan-project-aa54d',
    storageBucket: 'plan-project-aa54d.appspot.com',
    iosBundleId: 'dhy.company.booking.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgk1wnxfDqXkpfTLlE8953tW4NTo18tns',
    appId: '1:266439129607:ios:754eff3dee8d025e04c8a2',
    messagingSenderId: '266439129607',
    projectId: 'plan-project-aa54d',
    storageBucket: 'plan-project-aa54d.appspot.com',
    iosBundleId: 'com.example.bookingApp.RunnerTests',
  );
}