import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memesapp/views/add_post_page.dart';
import 'package:memesapp/views/home.dart';
import './views/authenticate_pages/login_page.dart';
import './views/authenticate_pages/register_page.dart';
import './views/authenticate_pages/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MainPage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Memes App",
      color: Color(0xFF4b67f2),
      // onUnknownRoute: ,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1a1a1a),
        primaryColor: Color(0xFF4b67f2),
        accentColor: Colors.white,
        canvasColor: Color(0xFF2b2b2b),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: "Quicksand",
          ),
          headline1: TextStyle(
            fontFamily: "Ubuntu",
          ),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/addpage': (context) => AddPostPage(),
      },
    );
  }
}
