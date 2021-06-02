import 'package:flutter/foundation.dart';

class Post {
  String uid;
  String category;
  String caption;
  String imageUrl;
  DateTime createdTime;

  Post({
    @required this.uid,
    @required this.category,
    @required this.caption,
    @required this.imageUrl,
    @required this.createdTime,
  });

  Map<String, dynamic> toDict(Post post) {
    final Map<String, dynamic> userData = {
      'uid': post.uid,
      'category': post.category,
      'caption': post.caption,
      'imageUrl': post.imageUrl,
      'createdTime': post.createdTime
    };
    return userData;
  }
}
