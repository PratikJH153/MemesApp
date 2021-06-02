import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memesapp/widgets/add_button.dart';
import './navigation_icon.dart';

Widget bottomBar({
  BuildContext context,
  int currentIndex,
  Function onpress,
}) {
  return Container(
    margin: EdgeInsets.only(
      left: 12,
      right: 12,
      bottom: 12,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black38,
    ),
    padding: EdgeInsets.symmetric(vertical: 13),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        navigationIcon(
          context: context,
          icon: CupertinoIcons.bolt_horizontal,
          onpressed: () {
            onpress(0);
          },
          isSelected: currentIndex == 0,
        ),
        navigationIcon(
          context: context,
          icon: CupertinoIcons.search,
          onpressed: () {
            onpress(1);
          },
          isSelected: currentIndex == 1,
        ),
        AddButton(),
        navigationIcon(
          context: context,
          icon: CupertinoIcons.person_2_alt,
          onpressed: () {
            onpress(2);
          },
          isSelected: currentIndex == 2,
        ),
        navigationIcon(
          context: context,
          icon: CupertinoIcons.profile_circled,
          onpressed: () {
            onpress(3);
          },
          isSelected: currentIndex == 3,
        ),
      ],
    ),
  );
}
