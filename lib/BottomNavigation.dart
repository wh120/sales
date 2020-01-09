import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sales/Details.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'Card.dart';
import 'Chat/ChatScreen.dart';
import 'Http/Request.dart';
import 'List.dart';
import 'Profile.dart';
import 'Http/APIurls.dart';
import 'Widgets/Card.dart';
class navbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: nv()
    );
  }
}
class nv extends StatefulWidget {

  @override
  _nvState createState() => _nvState();
}

class _nvState extends State<nv> {
  int current = 0;
  final PageController pageController = PageController( keepPage: true );
  @override
  Widget build(BuildContext context) {

    GlobalKey bottomNavigationKey = GlobalKey();

    List<Widget> pages = [
      Offers(),
      MyCard(),
      ChatScreen(),
     // AnimList(),

    ];

    return Scaffold(
      drawerEdgeDragWidth: 50,
      appBar: AppBar(

        backgroundColor: Colors.white,
          title: Image.asset('images/itos.png', fit: BoxFit.fitWidth),


          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          )
      ),
      drawer: Drawer(

        child: Profile(),

      ),

        drawerScrimColor: Colors.transparent,

      bottomNavigationBar: FancyBottomNavigation(


        key: bottomNavigationKey,
        initialSelection: current,
        tabs: [
          TabData(iconData: Icons.home, title: "Home" ,onclick: null),

          TabData(iconData: Icons.computer, title: "Products" , onclick: null),
          TabData(iconData: Icons.message, title: "Chat" , onclick: null),
        ],

        onTabChangedListener: (position) {
          current = position;
            pageController.animateToPage(position, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
          //  currentPage = position;

        },
      ),
       body: PageView(

        onPageChanged: (i) {
       //    setState(() => currentPage = i);
           final FancyBottomNavigationState fState =
               bottomNavigationKey.currentState;
           fState.setPage(i);

        },
    controller: pageController,
    children: pages,
    ),
    );

  }

  Widget Offers()
  {
    return FutureBuilder(
      builder:printoffers ,
      future:getlist() ,
    );

  }
  Future<List<dynamic>>getlist() async
  {

    List<dynamic> list = await getOffers();
    return list;

  }
  Widget printoffers(context, AsyncSnapshot d)
  {

    if (d.connectionState == ConnectionState.none &&
        d.hasData == null) {
      // print('project snapshot data is: ${projectSnap.data}');
      return Container();
    }
    if (!d.hasData) {
      return Center(child: CircularProgressIndicator());
    }
    var offers = d.data;




    return Timeline.builder(
        itemCount: offers.length,
        physics: TimelinePosition.Left == TimelinePosition.Left
            ? ClampingScrollPhysics()
            : BouncingScrollPhysics(),
        position: TimelinePosition.Left,
      itemBuilder: (BuildContext context, int i){


        String imageUrl='';
        if(offers[i]['image'] =='' || offers[i]['image'] ==null)
          imageUrl ='http://www.itos-me.com/assets/site/aboutus/e7301-intro.png';
        else
          imageUrl =OffersImageUrl+offers[i]["image"];
       // print(imageUrl);

        final textTheme = Theme
            .of(context)
            .textTheme;
        return TimelineModel(
            TimeLineCard(
                imageUrl,
                '',
                offers[i]["offer_title"],
                '',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details(
                        imageUrl,
                        i.toString(),
                        offers[i]['offer_title'],
                        offers[i]['offer_text']
                    )),
                  );
                }
            )
            ,
            position:
            i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
            isFirst: i == 0,
            isLast: i == offers.length,
            iconBackground: Colors.blue,
            icon: Icon(Icons.check ,color: Colors.white,)
        );


      },

    );


  }

  timelineModel1(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: data1.length,
      physics: position == TimelinePosition.Left
          ? ClampingScrollPhysics()
          : BouncingScrollPhysics(),
      position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    //final d = data[i];
    final textTheme = Theme
        .of(context)
        .textTheme;
    return TimelineModel(
      TimeLineCard(
          data1[i]["image"],
          '',
          data1[i]["name"],
          '',
        () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details('','','','' )),
          );
         }
      )
        ,
        position:
        i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == data1.length,
        iconBackground: Colors.blue,
        icon: Icon(Icons.check ,color: Colors.white,)
    );
  }
}

