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
    apiKey: 'AIzaSyCIDQkElICbMZO_hQgZoSyFw4B7PKNE40U',
    appId: '1:429433041024:web:244704cf136f22f9c7f665',
    messagingSenderId: '429433041024',
    projectId: 'fir-basics-flutter-d43fc',
    authDomain: 'fir-basics-flutter-d43fc.firebaseapp.com',
    storageBucket: 'fir-basics-flutter-d43fc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChaVCpiifkysukjIGGRGdVv5m6CqyzHlA',
    appId: '1:429433041024:android:cd54d9484658fe73c7f665',
    messagingSenderId: '429433041024',
    projectId: 'fir-basics-flutter-d43fc',
    storageBucket: 'fir-basics-flutter-d43fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnX773u89t3WXFODNXbklC3ZRil0vzfsE',
    appId: '1:429433041024:ios:1e0605d06aec5af2c7f665',
    messagingSenderId: '429433041024',
    projectId: 'fir-basics-flutter-d43fc',
    storageBucket: 'fir-basics-flutter-d43fc.appspot.com',
    iosClientId: '429433041024-bugoibo9s9fgbh8au4mi09bk9e28nkj0.apps.googleusercontent.com',
    iosBundleId: 'com.example.fakerAppFlutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnX773u89t3WXFODNXbklC3ZRil0vzfsE',
    appId: '1:429433041024:ios:1e0605d06aec5af2c7f665',
    messagingSenderId: '429433041024',
    projectId: 'fir-basics-flutter-d43fc',
    storageBucket: 'fir-basics-flutter-d43fc.appspot.com',
    iosClientId: '429433041024-bugoibo9s9fgbh8au4mi09bk9e28nkj0.apps.googleusercontent.com',
    iosBundleId: 'com.example.fakerAppFlutterFirebase',
  );
}
