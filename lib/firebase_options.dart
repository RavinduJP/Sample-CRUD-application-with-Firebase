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
    apiKey: 'AIzaSyByscaQAeEQ5KRRvohICgOkMLh-b_AnAzQ',
    appId: '1:678546784839:web:5c102a473246689778a762',
    messagingSenderId: '678546784839',
    projectId: 'sample-crud-project-d303a',
    authDomain: 'sample-crud-project-d303a.firebaseapp.com',
    storageBucket: 'sample-crud-project-d303a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDs5go8siuepdZOEK0PiG1OtQfthywxhNo',
    appId: '1:678546784839:android:9b291312aab4723778a762',
    messagingSenderId: '678546784839',
    projectId: 'sample-crud-project-d303a',
    storageBucket: 'sample-crud-project-d303a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATZCNxBjh1H9AgJv9SSWzJV4SmQvRPwGI',
    appId: '1:678546784839:ios:220e8dbbb9bb12fa78a762',
    messagingSenderId: '678546784839',
    projectId: 'sample-crud-project-d303a',
    storageBucket: 'sample-crud-project-d303a.appspot.com',
    iosBundleId: 'com.example.sampleCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATZCNxBjh1H9AgJv9SSWzJV4SmQvRPwGI',
    appId: '1:678546784839:ios:220e8dbbb9bb12fa78a762',
    messagingSenderId: '678546784839',
    projectId: 'sample-crud-project-d303a',
    storageBucket: 'sample-crud-project-d303a.appspot.com',
    iosBundleId: 'com.example.sampleCrud',
  );
}
