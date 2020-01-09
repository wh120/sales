import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'Http/APIurls.dart';
import 'Http/Request.dart';




class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Profile> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      builder: printprofile,
      future: get(),
    );
  }
  Future<Map<String, dynamic> >get() async
  {

    Map<String, dynamic> obj = await getprofile(user_id);
    return obj;

  }

  Widget printprofile(context, AsyncSnapshot d)
  {

    if (d.connectionState == ConnectionState.none &&
        d.hasData == null) {
      // print('project snapshot data is: ${projectSnap.data}');
      return Container();
    }
    if (!d.hasData) {
      return Center(child: CircularProgressIndicator());
    }
    var profdata =d.data;



    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://i.picsum.photos/id/669/200/300.jpg';

    return new Stack(children: <Widget>[
      new Container(color: Colors.blue,),
      new Image.network(imgUrl, fit: BoxFit.fill,),
      new BackdropFilter(
          filter: new ui.ImageFilter.blur(
            sigmaX: 6.0,
            sigmaY: 6.0,
          ),
          child: new Container(
            decoration: BoxDecoration(
              color:  Colors.blue.withOpacity(0.9),
              //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),)),
      new Scaffold(

        // drawer: new Drawer(child: new Container(),),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(CustomerImageUrl+profdata['image'])),
                new SizedBox(height: _height/25.0,),
                new Text(profdata['name'] + ' '+ profdata['nickname'] , style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  child:new Text(profdata['mobile_phone'], style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,) ,),
                new Padding(padding: new EdgeInsets.only(top: _height/60, left: _width/8, right: _width/8),
                  child:new Text(profdata['email'], style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,) ,),
                new Divider(height: _height/30,color: Colors.white,),
                new Row(
                  children: <Widget>[
                    rowCell('Company', profdata['company']),
                    rowCell('Address', profdata['address']),
                    //phone
                  ],),
                new Divider(height: _height/30,color: Colors.white),
                Expanded(child: SizedBox(),),
                new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){},
                  child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                    new Icon(Icons.edit),
                    new SizedBox(width: _width/30,),
                    new Text('Edit')
                  ],)),color: Colors.blue[50],),),
                SizedBox(height: 10,),
              ],
            ),
          )
      )
    ],);
  }

  Widget rowCell(String count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.white),),
    new Text(type,style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
}