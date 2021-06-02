import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memesapp/helper/authentication.dart';
import 'package:memesapp/views/home.dart';
import 'package:memesapp/views/info_page.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthenticationHelper authenticationHelper = AuthenticationHelper();
  bool userloggedin = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User user;

  void checkUserIsSignedIn() {
    User currentUser;
    currentUser = auth.currentUser;
    setState(() {
      if (currentUser != null) {
        userloggedin = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkUserIsSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return userloggedin ? HomePage() : InfoPage();
  }
}
