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
    apiKey: 'AIzaSyAy3utEw93YbObFFsC6MmM4kQOMXFsRRcY',
    appId: '1:777754076379:web:3427b3e49c54171b07d8fe',
    messagingSenderId: '777754076379',
    projectId: 'instagram-clone-bb0ff',
    authDomain: 'instagram-clone-bb0ff.firebaseapp.com',
    storageBucket: 'instagram-clone-bb0ff.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATERaDFBgvHXQjXwcjdobtUG3wXkFAjW8',
    appId: '1:777754076379:android:3bf664a2aa33a2ad07d8fe',
    messagingSenderId: '777754076379',
    projectId: 'instagram-clone-bb0ff',
    storageBucket: 'instagram-clone-bb0ff.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrUDZKsUPP7_stRNC94WFL3_myWnizY9M',
    appId: '1:777754076379:ios:8f50557f5ac2f27f07d8fe',
    messagingSenderId: '777754076379',
    projectId: 'instagram-clone-bb0ff',
    storageBucket: 'instagram-clone-bb0ff.appspot.com',
    iosClientId: '777754076379-f9uia88mm4m1r0b4gumqeak9uv1dkamu.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterInstagram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrUDZKsUPP7_stRNC94WFL3_myWnizY9M',
    appId: '1:777754076379:ios:8f50557f5ac2f27f07d8fe',
    messagingSenderId: '777754076379',
    projectId: 'instagram-clone-bb0ff',
    storageBucket: 'instagram-clone-bb0ff.appspot.com',
    iosClientId: '777754076379-f9uia88mm4m1r0b4gumqeak9uv1dkamu.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterInstagram',
  );
}
