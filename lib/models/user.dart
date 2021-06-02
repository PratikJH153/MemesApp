import 'package:flutter/foundation.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final DateTime createdTime;

  User({
    @required this.uid,
    @required this.username,
    @required this.email,
    @required this.createdTime,
  });

  Map<String, dynamic> toDict(User user) {
    final Map<String, dynamic> userData = {
      'uid': user.uid,
      'username': user.username,
      'email': user.email,
      'createdTime': user.createdTime,
    };
    return userData;
  }
}
