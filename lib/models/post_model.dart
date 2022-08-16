import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String username;
  final String uid;
  final String postId;
  final datePublish;
  final String profileImg;
  final String postUrl;
  final likes;

  Post({
    required this.description,
    required this.username,
    required this.uid,
    required this.postId,
    required this.datePublish,
    required this.profileImg,
    required this.postUrl,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "desccription": description,
        "uid": uid,
        "postId": postId,
        "datePublish": datePublish,
        "profileImg": profileImg,
        "postUrl": postUrl,
        "likes": likes,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      description: snapshot['description'],
      username: snapshot['username'],
      uid: snapshot["uid"],
      postId: snapshot["postId"],
      datePublish: snapshot["datePublish"],
      profileImg: snapshot["profileImg"],
      postUrl: snapshot["postUrl"],
      likes: snapshot["likes"],
    );
  }
}
