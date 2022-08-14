import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/Screens/auth_screens/login_screen.dart';
import 'package:flutter_instagram/utils/constants/colors.dart';
import 'package:flutter_instagram/utils/responsiveLayout/mobile_screen.dart';
import 'package:flutter_instagram/utils/responsiveLayout/responsive_layout_screen.dart';
import 'package:flutter_instagram/utils/responsiveLayout/web_screen.dart';

import 'Screens/auth_screens/signup_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreen: MobileScreen(),
      //   webScreen: WebScreen(),
      // ),

      home: SignupScreen(),
    );
  }
}
