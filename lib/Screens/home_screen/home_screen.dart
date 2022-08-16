import 'package:flutter/material.dart';
import 'package:flutter_instagram/Screens/home_screen/post_feed.dart';
import 'package:flutter_instagram/utils/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          color: primaryColor,
          height: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.messenger_outline),
          ),
        ],
      ),
      body: PostFeed(),
    );
  }
}
