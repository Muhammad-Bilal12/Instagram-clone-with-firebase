import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_instagram/models/post_model.dart';
import 'package:flutter_instagram/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FireStorageMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> uploadPhoto(
    String description,
    String uid,
    Uint8List file,
    String username,
    String profileImg,
  ) async {
    String res = "Some error Occured";
    String postid = const Uuid().v1();
    try {
      String photoUrl =
          await StorageMethods().uploadImgToStorage('posts', file, true);

      Post post = Post(
        description: description,
        username: username,
        uid: uid,
        postId: postid,
        datePublish: DateTime.now(),
        profileImg: profileImg,
        postUrl: photoUrl,
        likes: [],
      );

      _firestore.collection('posts').doc(postid).set(post.toJson());
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
