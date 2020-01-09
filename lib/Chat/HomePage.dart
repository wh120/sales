import 'package:flutter/material.dart';
import 'ChatScreen.dart';

class ChatHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Chat App"),
        ),
        body: new ChatScreen()
    );
  }
}