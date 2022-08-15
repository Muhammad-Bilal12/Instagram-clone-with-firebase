import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String username;
  final String uid;
  final String bio;
  final String profileUrl;
  final List follower;
  final List following;

  User({
    required this.email,
    required this.username,
    required this.uid,
    required this.bio,
    required this.profileUrl,
    required this.follower,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "uid": uid,
        "bio": bio,
        "profileUrl": profileUrl,
        "follower": follower,
        "following": following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'],
      username: snapshot['username'],
      uid: snapshot["uid"],
      bio: snapshot["bio"],
      profileUrl: snapshot["profileUrl"],
      follower: snapshot["follower"],
      following: snapshot["following"],
    );
  }
}
