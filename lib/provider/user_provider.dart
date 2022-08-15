import 'package:flutter/material.dart';
import 'package:flutter_instagram/resources/auth_methods.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _auth = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _auth.getUserDetail();

    _user = user;

    notifyListeners();
  }
}
