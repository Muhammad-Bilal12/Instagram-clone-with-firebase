import 'package:flutter/material.dart';
import 'package:flutter_instagram/utils/constants/colors.dart';

import '../constants/global_variable.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          backgroundColor: mobileBackgroundColor,
          selectedIconTheme: IconThemeData(color: blueColor),
          unselectedIconTheme: IconThemeData(color: secondaryColor),
          items: const [
            BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: '', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: '', icon: Icon(Icons.add_circle)),
            BottomNavigationBarItem(label: '', icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
          ]),
    );
  }
}
