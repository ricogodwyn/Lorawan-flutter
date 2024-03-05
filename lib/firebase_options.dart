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
    apiKey: 'AIzaSyBml0C9YCaf9qDP2pebzBMfswLzC8Po-F0',
    appId: '1:326901849643:web:cbaedec0da33747179546e',
    messagingSenderId: '326901849643',
    projectId: 'lorawan2',
    authDomain: 'lorawan2.firebaseapp.com',
    storageBucket: 'lorawan2.appspot.com',
    measurementId: 'G-B5KF9C2GMV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdvY85nCZG6fzwekVg_2Vro_8UbtgBzBE',
    appId: '1:326901849643:android:4e6c4fbb31168f8e79546e',
    messagingSenderId: '326901849643',
    projectId: 'lorawan2',
    storageBucket: 'lorawan2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADfTydiPP2A0lQMpU1zj-Yz4LLYJxxQt8',
    appId: '1:326901849643:ios:fc1a05be55e7020f79546e',
    messagingSenderId: '326901849643',
    projectId: 'lorawan2',
    storageBucket: 'lorawan2.appspot.com',
    iosBundleId: 'com.example.lorawanAntares',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADfTydiPP2A0lQMpU1zj-Yz4LLYJxxQt8',
    appId: '1:326901849643:ios:41634b08957d180b79546e',
    messagingSenderId: '326901849643',
    projectId: 'lorawan2',
    storageBucket: 'lorawan2.appspot.com',
    iosBundleId: 'com.example.lorawanAntares.RunnerTests',
  );
}