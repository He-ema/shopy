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
    apiKey: 'AIzaSyCw37uS9KifRO2odlyhsv0kYw6l69YYj_4',
    appId: '1:24109421365:web:fe6db880cbec19b39e727c',
    messagingSenderId: '24109421365',
    projectId: 'shopy-7831e',
    authDomain: 'shopy-7831e.firebaseapp.com',
    storageBucket: 'shopy-7831e.appspot.com',
    measurementId: 'G-DTSMZSS7KH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBKoIyIG01UExqzegra1oXIPY9AWJQQLA',
    appId: '1:24109421365:android:c6f3085877dd8a769e727c',
    messagingSenderId: '24109421365',
    projectId: 'shopy-7831e',
    storageBucket: 'shopy-7831e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBuNhKaLdUmCvkPLjzTLCCMebIQHYn9s8',
    appId: '1:24109421365:ios:b0ab6c909dc00f879e727c',
    messagingSenderId: '24109421365',
    projectId: 'shopy-7831e',
    storageBucket: 'shopy-7831e.appspot.com',
    iosBundleId: 'com.example.shopy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBuNhKaLdUmCvkPLjzTLCCMebIQHYn9s8',
    appId: '1:24109421365:ios:90978374a41745979e727c',
    messagingSenderId: '24109421365',
    projectId: 'shopy-7831e',
    storageBucket: 'shopy-7831e.appspot.com',
    iosBundleId: 'com.example.shopy.RunnerTests',
  );
}
