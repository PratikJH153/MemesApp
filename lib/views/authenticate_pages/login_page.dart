import 'package:flutter/material.dart';
import 'package:memesapp/helper/authentication.dart';
import 'package:memesapp/widgets/asking_user_authentication.dart';
import 'package:memesapp/widgets/authenticate_button.dart';
import 'package:memesapp/widgets/top_intro_authenticate.dart';
import '../../widgets/textfields.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationHelper authenticationHelper = AuthenticationHelper();

  final _formKey = GlobalKey<FormState>();

  void loginUser(BuildContext context) {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      authenticationHelper
          .loginVolunteer(
            email: _emailController.text,
            password: _passwordController.text,
          )
          .then(
            (value) => Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (Route<dynamic> route) => false,
            ),
          );
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
              mainAxisSize: MainAxisSize.max,
              children: [
                topIntroAuthenticate(
                  context: context,
                  title: "Let's sign you in.",
                  des1: "Welcome back.",
                  des2: "You've been missed!",
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                  margin: EdgeInsets.only(top: height * 0.2),
                  child: Column(
                    children: [
                      askingUserAuthenticate(
                        context: context,
                        label: "Don't have an account? ",
                        page: "Register",
                        route: '/register',
                      ),
                      authenticateButton(
                        context: context,
                        label: "Sign in",
                        function: () => loginUser(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
