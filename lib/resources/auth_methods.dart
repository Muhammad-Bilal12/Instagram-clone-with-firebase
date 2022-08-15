import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram/models/user_model.dart' as model;
import 'package:flutter_instagram/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// getUserDetail

  Future<model.User> getUserDetail() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

// Signup user
  Future<String> signupUser({
    required String email,
    required String username,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some Error Occured! ";
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // User Authentication
        final userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(userCred.user!.uid);
// firebase Storage
        String profileUrl = await StorageMethods()
            .uploadImgToStorage("profilePics", file, false);

// firebase Database with document user id

        model.User user = model.User(
          email: email,
          username: username,
          uid: userCred.user!.uid,
          bio: bio,
          profileUrl: profileUrl,
          follower: [],
          following: [],
        );

        await _firestore.collection("users").doc(userCred.user!.uid).set(
              user.toJson(),
            );

        res = "sucess";
      }
    } catch (err) {
      res = res + err.toString();
    }
    return res;
  }

// ----Login User Auth --------//

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some Error Occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      }
    } catch (err) {
      res = res + err.toString();
      print(res);
    }

    return res;
  }
}
