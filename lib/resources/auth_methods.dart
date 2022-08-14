import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
        await _firestore.collection("users").doc(userCred.user!.uid).set(
          {
            "email": email,
            'username': username,
            'uid': userCred.user!.uid,
            'bio': bio,
            "photoUrl": profileUrl,
            'follower': [],
            'following': [],
          },
        );

        res = "sucess";
      }
    } catch (err) {
      res = res + err.toString();
    }
    return res;
  }
}
