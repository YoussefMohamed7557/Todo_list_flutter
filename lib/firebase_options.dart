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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA58ZFR0QuoHyduOW9FKSVChmzIixoI8MM',
    appId: '1:931518371624:android:4a21223129b9d4e58da21d',
    messagingSenderId: '931518371624',
    projectId: 'to-list-flutter',
    storageBucket: 'to-list-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8w8M2G47zXCB8EGN4G1O3mPzzbPSv9-o',
    appId: '1:931518371624:ios:5be421af294e00688da21d',
    messagingSenderId: '931518371624',
    projectId: 'to-list-flutter',
    storageBucket: 'to-list-flutter.appspot.com',
    iosBundleId: 'com.example.todoListFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC69hyBLJFNAK9UvzTzLmHHOLzhtPWGQ-g',
    appId: '1:931518371624:web:6113c82f93ceb8138da21d',
    messagingSenderId: '931518371624',
    projectId: 'to-list-flutter',
    authDomain: 'to-list-flutter.firebaseapp.com',
    storageBucket: 'to-list-flutter.appspot.com',
    measurementId: 'G-76W7E0GQ7Z',
  );
}
