import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_instagram/utils/constants/responsive.dart';
import 'package:flutter_instagram/utils/responsiveLayout/web_screen.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.webScreen,
    required this.mobileScreen,
  }) : super(key: key);
  final Widget webScreen;
  final Widget mobileScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          // web Layout
          return WebScreen();
        } else {
          // Mobile Layout
          return mobileScreen;
        }
      },
    );
  }
}
