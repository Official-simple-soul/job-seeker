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
    apiKey: 'AIzaSyC2mzdH4G9DktcUG_4iYnhop3Trf3vlWng',
    appId: '1:710793831619:web:8b53dd6c014e0baac56e76',
    messagingSenderId: '710793831619',
    projectId: 'job-seeker-5306d',
    authDomain: 'job-seeker-5306d.firebaseapp.com',
    storageBucket: 'job-seeker-5306d.appspot.com',
    measurementId: 'G-WBVYC9SPMF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFWT2KewTSEfGlmu0L22GGJV0j3iKJGko',
    appId: '1:710793831619:android:184fca58d0320c0bc56e76',
    messagingSenderId: '710793831619',
    projectId: 'job-seeker-5306d',
    storageBucket: 'job-seeker-5306d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5wrcqCihwOOZcoX43NMZGtt8yK-a8XcA',
    appId: '1:710793831619:ios:45cd0aa4f814bad9c56e76',
    messagingSenderId: '710793831619',
    projectId: 'job-seeker-5306d',
    storageBucket: 'job-seeker-5306d.appspot.com',
    iosBundleId: 'com.example.jobSeeker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5wrcqCihwOOZcoX43NMZGtt8yK-a8XcA',
    appId: '1:710793831619:ios:0236c40d2cf748d7c56e76',
    messagingSenderId: '710793831619',
    projectId: 'job-seeker-5306d',
    storageBucket: 'job-seeker-5306d.appspot.com',
    iosBundleId: 'com.example.jobSeeker.RunnerTests',
  );
}
