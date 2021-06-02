import 'package:flutter/material.dart';
import 'package:memesapp/widgets/constants.dart';

Widget topIntroAuthenticate({
  @required BuildContext context,
  @required String title,
  @required String des1,
  @required String des2,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 30),
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.chevron_left),
          iconSize: 32,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          title,
          style: kIntroTextStyle,
        ),
      ),
      Text(
        des1,
        style: kDesTextStyle,
      ),
      Text(
        des2,
        style: kDesTextStyle,
      ),
    ],
  );
}
