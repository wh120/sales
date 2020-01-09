import 'package:flutter/material.dart';
import 'MenuTabBar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new SafeArea(
            child: new Stack(children: <Widget>[
      c(),
      new MenuTabBar(
        background: Colors.blue,
        iconButtons: [
          new IconButton(
              color: Colors.blue,
              icon: new Icon(Icons.home, size: 30),
              onPressed: () {}),
          new IconButton(
              color: Colors.blue,
              icon: new Icon(Icons.search, size: 30),
              onPressed: () {}),
          new IconButton(
              color: Colors.blue,
              icon: new Icon(Icons.map, size: 30),
              onPressed: () {}),
          new IconButton(
              color: Colors.blue,
              icon: new Icon(Icons.favorite, size: 30),
              onPressed: () {}),
        ],
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  child: new Text("Reminder",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  margin: EdgeInsets.all(10)),
              new Container(
                  child: new Text("Camera",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  margin: EdgeInsets.all(10)),
              new Container(
                  child: new Text("Attchment",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  margin: EdgeInsets.all(10)),
              new Container(
                  child: new Text("Text Note",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  margin: EdgeInsets.all(10))
            ]),
      )
    ])));
  }

  Widget c() {

    int columnCount = 1;
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text('title'),
                 subtitle: Text('subtitle'),

            ),
              ),
            ),
          );
        },
      ),
    );

  }
}
