import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memesapp/helper/authentication.dart';

enum DatabaseStages {
  AddingUser,
  AddedUser,
  ErrorAddingUser,
}

class DatabaseHelper {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUserData({
    Map<String, dynamic> userData,
  }) async {
    await firestore
        .collection("Users")
        .doc(userData['uid'])
        .set(userData)
        .then((value) => print("User added"))
        .catchError((err) {
      print("ERROR WHILE ADDING VOLUNTEERING DATA");
    });
  }

  Future<String> getUsername() async {
    String uid = AuthenticationHelper().auth.currentUser.uid;
    String username;
    await firestore.collection("Users").doc(uid).get().then((value) {
      username = value['username'];
    });
    print(username);
    return username;
  }

  Future<void> uploadPost(Map<String, dynamic> postData) async {
    await firestore
        .collection("Posts")
        .add(postData)
        .then((value) => print("DONE UPLADING"))
        .catchError((err) {
      print(err);
    });
  }
}
