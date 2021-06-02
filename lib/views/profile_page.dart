import 'package:flutter/material.dart';
import 'package:memesapp/helper/authentication.dart';
import 'package:memesapp/widgets/authenticate_button.dart';

class ProfilePage extends StatelessWidget {
  final AuthenticationHelper authenticationHelper = AuthenticationHelper();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: authenticateButton(
        context: context,
        label: "Logout",
        function: () {
          authenticationHelper.signOut().then(
                (value) => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                ),
              );
        },
      ),
    );
  }
}
