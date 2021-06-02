import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddButton extends StatelessWidget {
  final picker = ImagePicker();

  Future getImage(BuildContext context) async {
    File image;
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Navigator.pushNamed(context, '/addpage', arguments: image);
    } else {
      print('No image selected.');
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return getImage(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(4),
        child: Icon(
          CupertinoIcons.add,
          color: Colors.black54,
        ),
      ),
    );
  }
}
