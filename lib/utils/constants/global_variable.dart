import 'package:flutter/material.dart';
import 'package:flutter_instagram/Screens/home_screen/home_screen.dart';

import '../../Screens/add_post_screen.dart/add_post.dart';

const List<Widget> screens = <Widget>[
  HomeScreen(),
  Center(
    child: Text("search"),
  ),
  AddPostScreen(),
  Center(
    child: Text("notift"),
  ),
  Center(
    child: Text("profile"),
  ),
];
