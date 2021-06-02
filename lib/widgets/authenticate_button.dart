import 'package:flutter/material.dart';

Widget authenticateButton({
  @required BuildContext context,
  @required String label,
  @required Function function,
}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).accentColor,
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.headline1.copyWith(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
      ),
    ),
  );
}
