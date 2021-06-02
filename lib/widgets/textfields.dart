import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextInputType keyboardType(String title) {
  if (title == "Username") {
    return TextInputType.name;
  } else if (title == "Email") {
    return TextInputType.emailAddress;
  } else if (title == "Password") {
    return TextInputType.visiblePassword;
  } else {
    return TextInputType.text;
  }
}

Widget textFields({
  @required TextEditingController textFieldController,
  @required String label,
  @required Function validate,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      autocorrect: label != "Password" ? true : false,
      autofocus: false,
      validator: validate,
      cursorColor: Color(0xFF4b67f2),
      controller: textFieldController,
      obscureText: label == "Password" ? true : false,
      keyboardType: keyboardType(label),
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.red,
        suffixIcon: label == "Password"
            ? Icon(
                CupertinoIcons.lock,
                size: 20,
              )
            : SizedBox(),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.grey[700],
            width: 0.8,
          ),
        ),
      ),
    ),
  );
}
