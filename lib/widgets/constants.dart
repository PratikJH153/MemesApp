import 'package:flutter/material.dart';

double getDeviceHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}

double getDeviceWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}

const kDesTextStyle = TextStyle(
  fontFamily: 'Quicksand',
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: Color(0xFFEEEEEE),
  height: 1.5,
);

const kIntroTextStyle = TextStyle(
  fontFamily: "Ubuntu",
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

const kAppTitleTextStyle = TextStyle(
  fontFamily: "Ubuntu",
  fontSize: 21,
  fontWeight: FontWeight.bold,
);
