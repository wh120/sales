import 'package:flutter/material.dart';
import 'package:sales/LoginPage.dart';
import 'BottomNavigation.dart';
import 'Home.dart';
import 'Card.dart';
import 'MainPage.dart';
import 'TimeLine.dart';
import 'Chat/HomePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueGrey,
        cursorColor: Colors.blueGrey,
        textTheme: TextTheme(
          display1: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            color: Colors.orange,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          subhead: TextStyle(fontFamily: 'NotoSans'),
          body1: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: LoginScreen(),
    );
  }
}

