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
    apiKey: 'AIzaSyDJtH58_UId1deE2nTuI7MoaJvjeS8a3YE',
    appId: '1:820904811237:web:8a70966d69797aa0b3520c',
    messagingSenderId: '820904811237',
    projectId: 'crud-87924',
    authDomain: 'crud-87924.firebaseapp.com',
    storageBucket: 'crud-87924.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0FDYa8a4NXm8o8sAU-e4FTqlnzAZ9zg4',
    appId: '1:820904811237:android:bc1aa3d91986d644b3520c',
    messagingSenderId: '820904811237',
    projectId: 'crud-87924',
    storageBucket: 'crud-87924.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvKCdtVuo4kGUpr_00EWoVrVak2Q8P9Rs',
    appId: '1:820904811237:ios:e4d32d415ed91ce8b3520c',
    messagingSenderId: '820904811237',
    projectId: 'crud-87924',
    storageBucket: 'crud-87924.appspot.com',
    iosBundleId: 'com.example.crud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvKCdtVuo4kGUpr_00EWoVrVak2Q8P9Rs',
    appId: '1:820904811237:ios:eb6a31c3ee329baab3520c',
    messagingSenderId: '820904811237',
    projectId: 'crud-87924',
    storageBucket: 'crud-87924.appspot.com',
    iosBundleId: 'com.example.crud.RunnerTests',
  );
}
