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
    apiKey: 'AIzaSyAWvDyXxhBGWJuvhF1cICDIPdZ2CboJwS0',
    appId: '1:241549997071:web:edc1d621f92b37b8c95f7a',
    messagingSenderId: '241549997071',
    projectId: 'diary-firebase-cee83',
    authDomain: 'diary-firebase-cee83.firebaseapp.com',
    storageBucket: 'diary-firebase-cee83.appspot.com',
    measurementId: 'G-WK0Z6WEKTV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9x45lBiycSG_3jR1ZdgVakz3xQUtnMTw',
    appId: '1:241549997071:android:e16939515d77dda8c95f7a',
    messagingSenderId: '241549997071',
    projectId: 'diary-firebase-cee83',
    storageBucket: 'diary-firebase-cee83.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWhfwLGqWlAYe5Q4UBqP9E8cj5Wl2W3mE',
    appId: '1:241549997071:ios:efd3360a4127500ec95f7a',
    messagingSenderId: '241549997071',
    projectId: 'diary-firebase-cee83',
    storageBucket: 'diary-firebase-cee83.appspot.com',
    iosClientId: '241549997071-66jr5hnh7so3bmd69et9p62gt370jj3f.apps.googleusercontent.com',
    iosBundleId: 'com.example.diary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWhfwLGqWlAYe5Q4UBqP9E8cj5Wl2W3mE',
    appId: '1:241549997071:ios:efd3360a4127500ec95f7a',
    messagingSenderId: '241549997071',
    projectId: 'diary-firebase-cee83',
    storageBucket: 'diary-firebase-cee83.appspot.com',
    iosClientId: '241549997071-66jr5hnh7so3bmd69et9p62gt370jj3f.apps.googleusercontent.com',
    iosBundleId: 'com.example.diary',
  );
}
