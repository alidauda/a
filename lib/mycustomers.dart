import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'customerorders.dart';
import 'theme/light_color.dart';

class Mycustomers extends StatefulWidget {
  var userid;
  Mycustomers(this.userid);

  @override
  _MycustomersState createState() => _MycustomersState(userid);
}

class _MycustomersState extends State<Mycustomers> {
  var userid;
  _MycustomersState(this.userid);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text('My customers'),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("usercustomer")
                .doc(userid)
                .collection("mycustomers")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                height: 0.8 * height,
                child: ListView(children: [
                  ...snapshot.data!.docs.map((document) {
                    String username = document['username'];
                    String customerid = document['customerid'];

                    // String username = document['username'];
                    // String forumid = document['forumid'];
                    // String question = document['question'];
                    // String qid = document.id;
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 0.15 * height,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.1,
                                      width: width,
                                      child: ListTile(
                                        title: Text(username),
                                        trailing: Container(
                                          width: 0.3 * width,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:           MaterialStateProperty.all<Color>(
                                        Colors.white),
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .green)))),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Customerorders(userid,
                                                              customerid),
                                                    ));
                                              },
                                              child: Center(
                                                  child: Text(
                                                "see orders",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ))),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    // return ;
                  }).toList(),
                ]),
              );
            }),
      ),
    );
  }
}


//Successfulorders  

