import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_instagram/provider/user_provider.dart';
import 'package:flutter_instagram/utils/constants/responsive.dart';
import 'package:flutter_instagram/utils/responsiveLayout/web_screen.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({
    Key? key,
    required this.webScreen,
    required this.mobileScreen,
  }) : super(key: key);
  final Widget webScreen;
  final Widget mobileScreen;

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserData();
  }

  getUserData() async {
    UserProvider _userprovider = Provider.of(context, listen: false);

    await _userprovider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          // web Layout
          return WebScreen();
        } else {
          // Mobile Layout
          return widget.mobileScreen;
        }
      },
    );
  }
}
