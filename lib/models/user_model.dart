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
}
