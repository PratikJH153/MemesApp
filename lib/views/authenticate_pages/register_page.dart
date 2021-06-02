import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memesapp/database/database.dart';
import 'package:memesapp/helper/authentication.dart';
import 'package:memesapp/models/user.dart';
import 'package:memesapp/widgets/asking_user_authentication.dart';
import 'package:memesapp/widgets/authenticate_button.dart';
import 'package:memesapp/widgets/textfields.dart';
import 'package:memesapp/widgets/top_intro_authenticate.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthenticationHelper authenticationHelper = AuthenticationHelper();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  void register(BuildContext context) {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();

      authenticationHelper
          .registeringVolunteer(
        email: _emailController.text,
        password: _passwordController.text,
      )
          .then((value) {
        User user = User(
          uid: value,
          username: _usernameController.text.trim(),
          email: _emailController.text,
          createdTime: Timestamp.now().toDate(),
        );
        databaseHelper
            .addUserData(
              userData: user.toDict(user),
            )
            .then(
              (value) => Navigator.of(context).pushNamedAndRemoveUntil(
                '/home',
                (Route<dynamic> route) => false,
              ),
            );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topIntroAuthenticate(
                  context: context,
                  title: "Hi Memer.",
                  des1: "Welcome,",
                  des2: "To the Memes Community.",
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      textFields(
                        textFieldController: _usernameController,
                        label: "Username",
                        validate: (value) {},
                      ),
                      textFields(
                        textFieldController: _emailController,
                        label: "Email",
                        validate: (value) {},
                      ),
                      textFields(
                        textFieldController: _passwordController,
                        label: "Password",
                        validate: (value) {},
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.15),
                  child: Column(
                    children: [
                      askingUserAuthenticate(
                        context: context,
                        label: "Already have an account? ",
                        page: "Login",
                        route: '/login',
                      ),
                      authenticateButton(
                        context: context,
                        label: "Sign up",
                        function: () => register(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
