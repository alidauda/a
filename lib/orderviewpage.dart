import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'theme/light_color.dart';

class Orderview extends StatefulWidget {
  var post;
  Orderview(this.post);

  @override
  _OrderviewState createState() => _OrderviewState(post);
}

class _OrderviewState extends State<Orderview> {
  var post;
_OrderviewState(this.post);
  @override
  Widget build(BuildContext context) {

        var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green[400],title: Center(child: Text(post[0]['username']+"'s "+" order")),),
      body: SafeArea(
        child: Column(
          children: [
         
            Container(
              width: 0.99*width,
              height: 0.75*height,
              child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: post.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                                        // height: 0.5*height,
          
                                  child: Column(
                                    children: [
                  //                      Container(
                  //   height: 0.3*height,
                  //   width: 0.9*width,
                  //   child: ListView(
                  //     children: [
                  //                    for(var item in data['images'] ) Padding(
                  //                      padding: const EdgeInsets.all(8.0),
                  //                      child: CachedNetworkImage(imageUrl: item),
                  //                    )
          
                  //     ],
                  //   ),
          
                  // ),
                                      ListTile(
                                        title: Text(post[index]['username'] +
                                            " ordered " +
                                            post[index]['content']),
                                        subtitle:
                                            Text('at' + post[index]['createdAt']),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Divider(color:Colors.green),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
            ),
            Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child:  Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                                           width: 0.2*width,
                                          child: ElevatedButton(
          
                                              style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  18.0),
                                                          side: BorderSide(
                                                              color: Colors.red)))),
                                              onPressed: () {},
                                              child: Text(
                                                "reject",
                                                // style: TextStyle(color: Colors.green),
                                              )),
                                        ), Container(
                                           width: 0.2*width,
                                          child: ElevatedButton(
          
                                              style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  18.0),
                                                          side: BorderSide(
                                                              color: Colors.green)))),
                                              onPressed: () {},
                                              child: Text(
                                                "accept",
                                                // style: TextStyle(color: Colors.green),
                                              )),
                                        ),
              ],),
            ),
        
      ),
    ),
             
          ],
        ),
      ),
    );
  }
}