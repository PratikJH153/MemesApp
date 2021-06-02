import 'package:flutter/material.dart';
import 'package:memesapp/views/info_slider.dart';
import 'package:memesapp/widgets/bottom_button.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoSlider(),
            Spacer(),
            BottomButton(),
          ],
        ),
      ),
    );
  }
}
