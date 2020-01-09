import 'package:flutter/material.dart';

//
class TimeLineCard extends StatelessWidget {

  TimeLineCard(this.ImageUrl , this.S1 , this.S2 , this.S3 , this.onClick);
  String ImageUrl;
  String S1 ,S2 ,S3;

  var onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(

        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(image: NetworkImage(ImageUrl),

              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(S1),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                S2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                S3,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
