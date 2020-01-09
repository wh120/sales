

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget AnimList() {

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