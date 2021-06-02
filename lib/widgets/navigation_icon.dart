import 'package:flutter/material.dart';

Widget navigationIcon({
  BuildContext context,
  bool isSelected = false,
  IconData icon,
  Function onpressed,
}) {
  return GestureDetector(
    onTap: onpressed,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        isSelected
            ? Container(
                height: 6,
                width: 6,
                margin: EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Container(),
      ],
    ),
  );
}
