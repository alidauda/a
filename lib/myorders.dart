import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'theme/extention.dart';
import 'orderviewpage.dart';
import 'theme/light_color.dart';
import 'theme/text_styles.dart';

class Myorders extends StatefulWidget {
  var userid;
  Myorders(this.userid);

  @override
  _MyordersState createState() => _MyordersState(userid);
}

class _MyordersState extends State<Myorders> {
  var userid;
  _MyordersState(this.userid);
  add() async {
    await FirebaseFirestore.instance
        .collection("userorders")
        .doc(userid)
        .collection("myorders")
        .add({
      'post': [
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "pending",
          "username": "ali d"
        },
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "pending",
          "username": "ali d"
        },
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "pending",
          "username": "ali d"
        },
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "pending",
          "username": "ali d"
        },
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "pending",
          "username": "ali d"
        },
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "pending",
          "username": "ali d"
        },
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "pending",
          "username": "ali d"
        },
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "pending",
          "username": "ali d"
        },
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "pending",
          "username": "ali d"
        },
      ]
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("userorders")
                .doc(userid)
                .collection("myorders")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(children: [
                ...snapshot.data!.docs.map((document) {
                  var post;
                  try {
                    setState(() {
                      post = document['post'];
                    });
                  } catch (e) {}
                  Color randomColor() {
                    var random = Random();
                    final colorList = [
                      Theme.of(context).primaryColor,
                      LightColor.orange,
                      LightColor.green,
                      LightColor.grey,
                      LightColor.lightOrange,
                      LightColor.skyBlue,
                      LightColor.titleTextColor,
                      Colors.red,
                      Colors.brown,
                      LightColor.purpleExtraLight,
                      LightColor.skyBlue,
                    ];
                    var color = colorList[random.nextInt(colorList.length)];
                    return color;
                  }

                  // return Text(post.toString());
                  return Mycontainer(
                    height: height,
                    post: post,
                    width: width,
                    id: document.id,
                    userid: userid,
                  );
                  // return Container(
                  // height: double.maxFinite,
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: post.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       // return Container(
                  //       //                         height: 0.3*height,

                  //       //   child: Column(
                  //       //     children: [
                  //       //       ListTile(
                  //       //         title: Text(post[index]['username'] +
                  //       //             "ordered" +
                  //       //             post[index]['content']),
                  //       //         subtitle:
                  //       //             Text('at' + post[index]['createdAt']),
                  //       //       ),
                  //       //       Container(

                  //       //   width: 0.9*width,
                  //       //                         // height: 0.2*height,
                  //       //         child: ListTile(
                  //       //           title: Container(
                  //       //              width: 0.5*width,
                  //       //             child: DropdownButton<String>(
                  //       //               items: <String>[
                  //       //                 post[index]['status'],
                  //       //                 'pending',
                  //       //                 'delivering',
                  //       //                 'delivered',
                  //       //                 'recieved'
                  //       //               ].map((String value) {
                  //       //                 return DropdownMenuItem<String>(
                  //       //                   value: value,
                  //       //                   child: Text(value),
                  //       //                 );
                  //       //               }).toList(),
                  //       //               onChanged: (_) {},
                  //       //             ),
                  //       //           ),
                  //       //           trailing: Container(
                  //       //              width: 0.2*width,
                  //       //             child: ElevatedButton(
                  //       //                 style: ButtonStyle(
                  //       //                     shape: MaterialStateProperty.all<
                  //       //                             RoundedRectangleBorder>(
                  //       //                         RoundedRectangleBorder(
                  //       //                             borderRadius:
                  //       //                                 BorderRadius.circular(
                  //       //                                     18.0),
                  //       //                             side: BorderSide(
                  //       //                                 color: Colors.red)))),
                  //       //                 onPressed: () {},
                  //       //                 child: Text(
                  //       //                   "view",
                  //       //                   style: TextStyle(color: Colors.orange),
                  //       //                 )),
                  //       //           ),
                  //       //         ),
                  //       //       )
                  //       //     ],
                  //       //   ),
                  //       // );
                  //     },
                  //   ),
                  // );
                }).toList(),
              ]);
            }),
      ),
    );
  }
}

class Mycontainer extends StatefulWidget {
  Mycontainer(
      {Key? key,
      required this.height,
      required this.post,
      required this.width,
      required this.id,
      required this.userid
      // required this.selected,
      })
      : super(key: key);

  final double height;
  final post;
  final double width;
  final id;
  final userid;
  // final String? selected;
  var price = 2000;
  var status2 = "pending";

  @override
  _MycontainerState createState() => _MycontainerState();
}

class _MycontainerState extends State<Mycontainer> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.24 * widget.height,
      child: Column(
        children: [
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
              child: Column(
                children: [
                  ListTile(
                    title: Text("order #" + widget.id),
                    //  Text(widget.post[0]['username'] +
                    //     "ordered" +
                    //     widget.post[0]['content']),
                    subtitle: Text('at' + widget.post[0]['createdAt']),
                  ),
                  Container(
                    width: 0.9 * widget.width,
                    // height: 0.2*height,
                    child: ListTile(
                      title: Container(
                        width: 0.5 * widget.width,
                        child: DropdownButton<String>(
                          value: selected == null
                              ? widget.post[0]['status']
                              : selected,
                          items: <String>[
                            // post[0]['status'],
                            'pending',
                            'delivering',
                            'delivered',
                            'recieved'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) async {
                            setState(() => selected = value);

                            if (widget.status2 != "recieved" &&
                                selected == "recieved") {
                              var revenue = 0;
                              try {
                                await FirebaseFirestore.instance
                                    .collection('revenue')
                                    .doc(widget.userid)
                                    .get()
                                    .then((DocumentSnapshot documentSnapshot) {
                                  // if (documentSnapshot.exists) {
                                  print(
                                      'Document data: ${documentSnapshot.data()}');
                                  Map<String, dynamic> data = documentSnapshot
                                      .data()! as Map<String, dynamic>;

                                  setState(() {
                                    revenue = data["revenue"];
                                  });
                                  // } else {
                                  //   print('Document does not exist on the database');
                                  // }
                                });
                              } catch (e) {}

                              var total = revenue + widget.price;
                              try {
                                await FirebaseFirestore.instance
                                    .collection('revenue')
                                    .doc(widget.userid)
                                    .update({'revenue': total});
                              } catch (e) {
                                await FirebaseFirestore.instance
                                    .collection('revenue')
                                    .doc(widget.userid)
                                    .set({'revenue': total});
                              }

                              //add to revenue
                              setState(() => widget.status2 = value!);
                            } else if (widget.status2 == "recieved" &&
                                selected != "recieved") {
                              var revenue = 0;
                              try {
                                await FirebaseFirestore.instance
                                    .collection('revenue')
                                    .doc(widget.userid)
                                    .get()
                                    .then((DocumentSnapshot documentSnapshot) {
                                  // if (documentSnapshot.exists) {
                                  print(
                                      'Document data: ${documentSnapshot.data()}');
                                  Map<String, dynamic> data = documentSnapshot
                                      .data()! as Map<String, dynamic>;

                                  setState(() {
                                    revenue = data["revenue"];
                                  });
                                  // } else {
                                  //   print('Document does not exist on the database');
                                  // }
                                });
                              } catch (e) {}

                              var total = revenue - widget.price;

                              try {
                                await FirebaseFirestore.instance
                                    .collection('revenue')
                                    .doc(widget.userid)
                                    .update({'revenue': total});
                              } catch (e) {
                                await FirebaseFirestore.instance
                                    .collection('revenue')
                                    .doc(widget.userid)
                                    .set({'revenue': total});
                              }

                              //remove to revenue
                              setState(() => widget.status2 = value!);
                            } else {
                              setState(() => widget.status2 = value!);
                            }

                            // try {
                               await FirebaseFirestore.instance
        .collection("userorders")
        .doc(widget.userid)
        .collection("myorders").doc(widget.id).update({
"post"[0]:{'status':selected}
        });
                            // } catch (e) {

                            // }
                          },
                        ),
                      ),
                      trailing: Container(
                        width: 0.2 * widget.width,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side:
                                            BorderSide(color: Colors.green)))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Orderview(widget.post)),
                              );
                            },
                            child: Text(
                              "view",
                              style: TextStyle(color: Colors.green),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
