import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final String username;
  final String profileUrl;
  final String desc;
  final String postUrl;
  final int likes;
  final int comments;
  final String caption;

  PostTile({
    @required this.username,
    @required this.profileUrl,
    @required this.desc,
    @required this.postUrl,
    @required this.likes,
    @required this.comments,
    @required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  profileUrl,
                  height: 33,
                  width: 33,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$username\n",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: desc,
                      style: TextStyle(
                        fontFamily: 'QuickSand',
                        fontSize: 12,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.more_vert_rounded),
                onPressed: () {},
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 20,
                spreadRadius: 0.5,
                offset: Offset(0, 12),
              )
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                postUrl,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.whatshot),
                      SizedBox(
                        width: 5,
                      ),
                      Text("$likes")
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.chat_bubble_2),
                      SizedBox(
                        width: 5,
                      ),
                      Text("$comments")
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(CupertinoIcons.bookmark),
                  color: Colors.grey[200],
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 8),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$username  ",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        // "Hey guys, this is my first post on social meme and very excited to keep on posting on this awesome platform...",
                        caption,
                    style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 13,
                      height: 1.5,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 70,
              width: 200,
              child: Divider(),
            ),
          )
        ],
      ),
    );
  }
}
