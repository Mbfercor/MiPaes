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
    apiKey: 'AIzaSyCxHZvARdjRmZ9eDk_5jBWpD0uVv6aOk7I',
    appId: '1:110735389544:web:4d1404c44cdbfe9a12dcdd',
    messagingSenderId: '110735389544',
    projectId: 'mipaes-69fd6',
    authDomain: 'mipaes-69fd6.firebaseapp.com',
    storageBucket: 'mipaes-69fd6.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlP761xRnjwWnizvwDJlF-RSYRFYqAY4c',
    appId: '1:110735389544:android:a122082ca35db51e12dcdd',
    messagingSenderId: '110735389544',
    projectId: 'mipaes-69fd6',
    storageBucket: 'mipaes-69fd6.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXJC1KEz8b-uZl81MoxlxDfDYiVn2_ZEU',
    appId: '1:110735389544:ios:d357dff1043ba1f112dcdd',
    messagingSenderId: '110735389544',
    projectId: 'mipaes-69fd6',
    storageBucket: 'mipaes-69fd6.firebasestorage.app',
    iosBundleId: 'com.example.miPaes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXJC1KEz8b-uZl81MoxlxDfDYiVn2_ZEU',
    appId: '1:110735389544:ios:d357dff1043ba1f112dcdd',
    messagingSenderId: '110735389544',
    projectId: 'mipaes-69fd6',
    storageBucket: 'mipaes-69fd6.firebasestorage.app',
    iosBundleId: 'com.example.miPaes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCxHZvARdjRmZ9eDk_5jBWpD0uVv6aOk7I',
    appId: '1:110735389544:web:0ae11a8ca577c41812dcdd',
    messagingSenderId: '110735389544',
    projectId: 'mipaes-69fd6',
    authDomain: 'mipaes-69fd6.firebaseapp.com',
    storageBucket: 'mipaes-69fd6.firebasestorage.app',
  );
}
