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
    apiKey: 'AIzaSyB1CHhu9Rdr69oqXTRbuEy6zri0bJXkNto',
    appId: '1:485474077786:web:7e005796bd836d16cedc63',
    messagingSenderId: '485474077786',
    projectId: 'onlinefoodies-ff550',
    authDomain: 'onlinefoodies-ff550.firebaseapp.com',
    storageBucket: 'onlinefoodies-ff550.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDC4MeyDgTHnUxb9h4vIXpxkK51_5ovz5I',
    appId: '1:485474077786:android:9a552693cc003598cedc63',
    messagingSenderId: '485474077786',
    projectId: 'onlinefoodies-ff550',
    storageBucket: 'onlinefoodies-ff550.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSY6VSfhFqsyjt2gO5t68V1V3X5p1gILM',
    appId: '1:485474077786:ios:f00bdf411a6fd8eacedc63',
    messagingSenderId: '485474077786',
    projectId: 'onlinefoodies-ff550',
    storageBucket: 'onlinefoodies-ff550.firebasestorage.app',
    iosBundleId: 'com.example.deliveryFood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSY6VSfhFqsyjt2gO5t68V1V3X5p1gILM',
    appId: '1:485474077786:ios:f00bdf411a6fd8eacedc63',
    messagingSenderId: '485474077786',
    projectId: 'onlinefoodies-ff550',
    storageBucket: 'onlinefoodies-ff550.firebasestorage.app',
    iosBundleId: 'com.example.deliveryFood',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB1CHhu9Rdr69oqXTRbuEy6zri0bJXkNto',
    appId: '1:485474077786:web:b2ff6205e452e7ebcedc63',
    messagingSenderId: '485474077786',
    projectId: 'onlinefoodies-ff550',
    authDomain: 'onlinefoodies-ff550.firebaseapp.com',
    storageBucket: 'onlinefoodies-ff550.firebasestorage.app',
  );
}
