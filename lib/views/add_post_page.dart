import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memesapp/database/database.dart';
import 'package:memesapp/helper/authentication.dart';
import 'package:memesapp/models/post.dart';
import 'package:memesapp/widgets/authenticate_button.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final DatabaseHelper _helper = DatabaseHelper();
  String username;

  getUsername() async {
    String name = await _helper.getUsername();
    setState(() {
      username = name;
    });
  }

  Future<String> generateImgUrl(File image) async {
    final _firebaseStorage = FirebaseStorage.instance;
    String imageUrl;

    //Select Image
    var file = File(image.path);

    if (image != null) {
      //Upload to Firebase
      var snapshot =
          await _firebaseStorage.ref().child('images/imageName').putFile(file);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      imageUrl = downloadUrl;
    } else {
      print('No Image Path Received');
    }
    return imageUrl;
  }

  void uploadPost(File image) async {
    String imgUrl = await generateImgUrl(image);

    Post post = Post(
      uid: AuthenticationHelper().auth.currentUser.uid,
      caption: _captionController.text,
      category: _categoryController.text,
      createdTime: DateTime.now(),
      imageUrl: imgUrl,
    );

    await _helper.uploadPost(post.toDict(post)).then(
          (value) => Navigator.pushReplacementNamed(
            context,
            '/home',
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent.withOpacity(0),
        title: Text("New Post"),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            iconSize: 32,
            icon: Icon(CupertinoIcons.checkmark_alt),
            onPressed: () => uploadPost(image),
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 30),
                constraints: BoxConstraints.tightFor(height: 400),
                child: Image.file(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 25,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/images/profile2.png",
                              height: 36,
                              width: 36,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$username",
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.tag),
                          Expanded(
                            child: TextField(
                              controller: _categoryController,
                              decoration: InputDecoration(
                                hintText: "Category",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.captions_bubble),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _captionController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "Caption",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: authenticateButton(
                        context: context,
                        label: "Upload",
                        function: () => uploadPost(image),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
