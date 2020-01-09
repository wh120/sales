import 'package:flutter/material.dart';
import 'package:timeline_list/timeline_model.dart';

import 'Widgets/Card.dart';
//import 'Http/APIurls.dart';
class Details extends StatefulWidget {
//  var data;
  String ImageUrl;
  String S1 ,S2 ,S3;
  Details( this.ImageUrl , this.S1 , this.S2 , this.S3 );
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    print('image'+widget.ImageUrl);

    return Scaffold(
      body:  TimeLineCard(
          widget.ImageUrl,
          widget.S1,
          widget.S2,
          widget.S3,
              () {}
      ),
    );
  }

}
