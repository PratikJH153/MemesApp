import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memesapp/views/feeds_page.dart';
import 'package:memesapp/views/profile_page.dart';
import 'package:memesapp/views/search_page.dart';
import 'package:memesapp/views/subscribe_list_page.dart';
import 'package:memesapp/widgets/bottom_bar.dart';
import 'package:memesapp/widgets/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  int currentIndex = 0;

  var _appPageController = PageController();

  var pages = [
    FeedsPage(),
    SearchPage(),
    SubsribeListPage(),
    ProfilePage(),
  ];

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
    _appPageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(
        context: context,
        currentIndex: currentIndex,
        onpress: setBottomBarIndex,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                "SocialMemes",
                style: kAppTitleTextStyle,
              ),
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                children: pages,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _appPageController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
