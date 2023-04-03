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
    apiKey: 'AIzaSyBAyV9yupSs0WhGRwwIGjjZ5K9yNeDQ3vk',
    appId: '1:198950144564:web:7b41de9ea8524b44411861',
    messagingSenderId: '198950144564',
    projectId: 'flutter-chat-e5b9b',
    authDomain: 'flutter-chat-e5b9b.firebaseapp.com',
    storageBucket: 'flutter-chat-e5b9b.appspot.com',
    measurementId: 'G-EV68YJWEBL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBm1qwnJgIeFqKb2kjWvLvcrAR560e_7sA',
    appId: '1:198950144564:android:3dc4f7c9e56d222b411861',
    messagingSenderId: '198950144564',
    projectId: 'flutter-chat-e5b9b',
    storageBucket: 'flutter-chat-e5b9b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrkHCNRRixbHjGbgpEK6ncZBHqDhaxXgE',
    appId: '1:198950144564:ios:b1d4648076aaf74f411861',
    messagingSenderId: '198950144564',
    projectId: 'flutter-chat-e5b9b',
    storageBucket: 'flutter-chat-e5b9b.appspot.com',
    iosClientId: '198950144564-3q6d3f3knhs3iv83taiq1rvbppqjehgt.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrkHCNRRixbHjGbgpEK6ncZBHqDhaxXgE',
    appId: '1:198950144564:ios:b1d4648076aaf74f411861',
    messagingSenderId: '198950144564',
    projectId: 'flutter-chat-e5b9b',
    storageBucket: 'flutter-chat-e5b9b.appspot.com',
    iosClientId: '198950144564-3q6d3f3knhs3iv83taiq1rvbppqjehgt.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChatApp',
  );
}