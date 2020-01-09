import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales/Http/Request.dart';
import 'Details.dart';
import 'Http/APIurls.dart';

class MyCard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getlist() ,
      builder: printList ,
    );

  }
  Future<List<dynamic>>getlist() async
  {

    List<dynamic> list = await getProducts();
    return list;

  }

  Widget printList(context, AsyncSnapshot d)
  {
    if (d.connectionState == ConnectionState.none &&
        d.hasData == null) {
      // print('project snapshot data is: ${projectSnap.data}');
      return Container();
    }
    if (!d.hasData) {
      return Center(child: CircularProgressIndicator());
    }
    print(d.data.length);
    List<dynamic> list =d.data;
    print(list.length);
    return new ListView.builder(
      itemCount: list.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {


        String imageUrl='';
        if(list[i]['image'] ==null || list[i]['image'] =='')
          imageUrl ='http://www.itos-me.com/assets/site/aboutus/e7301-intro.png';
        else
          imageUrl =ProductsImageUrl+list[i]["image"];

        return Container(
          height: 130,
          child: Card(
//                color: Colors.blue,
            elevation: 10,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details(
                            imageUrl,
                            list[i]['price'].toString(),
                            list[i]['name'].toString(),
                            list[i]['description'].toString()
                        )),
                      );


                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(imageUrl) ,
                              fit: BoxFit.cover),
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.black)
                          ]),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child:Text(
                        list[i]["name"]
                    ),
                  ),

                ),



                GestureDetector(
                  onTap: () {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext conext) {
                        return AlertDialog(
                          title: Text(list[i]["name"]),
                          content:
                          Text(list[i]['description'] , textDirection: TextDirection.rtl,),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                               // Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.all(30.0),
                      child: Chip(
                        label: Text(list[i]["price"].toString()
                          ,style: TextStyle(color: Colors.white),
                        ),
                        //  shadowColor: Colors.blue,
                        backgroundColor: Colors.blue,
                        elevation: 10,
                        autofocus: true,
                      )
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}