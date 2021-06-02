import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget askingUserAuthenticate({
  @required BuildContext context,
  @required String label,
  @required String page,
  @required String route,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.grey[500],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            route,
          ),
          child: Text(
            page,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}
