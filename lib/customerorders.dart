import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'theme/extention.dart';
import 'orderviewpage.dart';
import 'theme/light_color.dart';
import 'theme/text_styles.dart';

class Customerorders extends StatefulWidget {
  var userid,customerid;
  Customerorders(this.userid,this.customerid);

  @override
  _CustomerordersState createState() => _CustomerordersState(userid);
}

class _CustomerordersState extends State<Customerorders> {
  var userid;
  _CustomerordersState(this.userid);
  add() async {
    await FirebaseFirestore.instance
        .collection("userorders")
        .doc(userid)
        .collection("myorders")
        .add({
      "customerid": "asa",
      "price": 4000,
      "status": "pending",
      'post': [
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "delivering",
          "username": "ali d"
        },
        {
          "content": "kai ka siyo min abbin nan",
          "createdAt": "21, Dec,2021",
          "status": "delivered",
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
    // add();
    // add();
    // add();
    // add();
    // add();
    // add();
    // add();
    // add();
    // add();
    // add();
    // add();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Center(child: Text("orders"),),),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                           .collection("users")
        .doc(userid)
        .collection("orders").where('customerid',isEqualTo: widget.customerid)
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
                      var 
                              total,
                              status,
                              accepted,
                              image,
                              quan,
                              address,
                              alt,
                              name,
                              orderId,
                              phoneNumber,
                              price,
                              quantity,
                              slug,
                              title,
                              usename,
                              userUID;

                          try {
                            setState(() {
                              // post = document['post'];
                              total = document['total'];
                              accepted = document['accepted'];
                              status = document['status'];
                              quan = document['quantity'];
                              image = document["image"];
                              address = document["address"];
                              alt = document["alt"];
                              name = document["name"];
                              orderId = document["orderId"];
                              phoneNumber = document["phoneNumber"];
                              price = document["price"];
                              quantity = document["quantity"];
                              slug = document["slug"];
                              status = document["status"];
                              title = document["title"];
                              usename = document["usename"];
                              userUID = document["userUID"];
                              // quantity = document["quantity"];
                              // post.add({
                              //   "image": image,
                              //   "address": address,
                              //   "alt": alt,
                              //   "name": name,
                              //   "orderId": orderId,
                              //   "phoneNumber": phoneNumber,
                              //   "price": price,
                              //   "quantity": quantity,
                              //   "slug": slug,
                              //   "status": status,
                              //   "title": title,
                              //   "usename": usename,
                              //   "userUID": userUID
                              // });

                              // print(post);
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
                            var color =
                                colorList[random.nextInt(colorList.length)];
                            return color;
                          }

                          // return Text(post.toString());
                          return Mycontainer(
                            height: height,
                            // post: post,
                            width: width,
                            id: document.id,
                            userid: userid!.uid,
                            status1: status,
                            total: total,
                            status2: status,
                            accepted: accepted,
                            image: image,
                            quan: quan,
                                          // "image": image,
                                address: address,
                                alt: alt,
                                name: name,
                                orderId: orderId,
                                phoneNumber: phoneNumber,
                                price: price,
                                quantity: quantity,
                                // slug: slug,
                                status: status,
                                // title: title,
                                // usename: usename,
                                // userUID: userUID
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
  Mycontainer({
  
  required this.name,required this.alt,required this.phoneNumber,required this.orderId,required this.status,required this.price,required this.quantity,required this.address,
    Key? key,
    required this.height,
    // required this.post,
    required this.width,
    required this.id,
    required this.userid,
    required this.total,
    required this.status2,
    required this.status1,
    required this.accepted,
    required this.image,
    required this.quan,

    // required this.selected,
  }) : super(key: key);

  final double height;
  // final post;
  final double width;
  final id;
  final userid;
  // final String? selected;
  var total;
  var status2;
  var status1, accepted, image, quan;
  var name,alt,phoneNumber,orderId,status,price,quantity,address;

  @override
  _MycontainerState createState() => _MycontainerState();
}

class _MycontainerState extends State<Mycontainer> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 0.22 * widget.height,
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
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                children: [
                  ListTile(
                    trailing:
                        // Text(widget.post[0]['image'].toString()),
                        Text(
                            widget.quan == null ? "1" : widget.quan.toString()),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: Colors.green,
                        ),
                        child: widget.image == null
                            ? Icon(Icons.category_sharp)
                            : Image.network(
                                widget.image,
                                height: 50,
                                width: 50,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    title: Text("order #" + widget.id),
                    //  Text(widget.post[0]['username'] +
                    //     "ordered" +
                    //     widget.post[0]['content']),
                  ),
                  Container(
                    width: 0.9 * widget.width,
                    // height: 0.2*height,
                    child: ListTile(
                      title: widget.accepted == null
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 8),
                              // child:  Padding(
                              // padding: const EdgeInsets.only(left: 40,right: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 0.2 * width,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.red),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                    side: BorderSide(
                                                        color: Colors.red)))),
                                        onPressed: () async {
                                          // try {
                                          await FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(widget.userid)
                                              .collection("orders")
                                              .doc(widget.id)
                                              .update({"accepted": false});
                                        },
                                        child: Text(
                                          "reject",
                                          // style: TextStyle(color: Colors.green),
                                        )),
                                  ),
                                  Container(
                                    width: 0.2 * width,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.green),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                    side: BorderSide(
                                                        color: Colors.green)))),
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(widget.userid)
                                              .collection("orders")
                                              .doc(widget.id)
                                              .update({"accepted": true});
                                        },
                                        child: Text(
                                          "accept",
                                          // style: TextStyle(color: Colors.green),
                                        )),
                                  ),
                                ],
                              ),
                              // ,
                            )
                          : widget.accepted == false
                              ? Container(
                                  width: 0.2 * width,
                                  child:
                                      // ElevatedButton(

                                      // onPressed: () {},
                                      // child:
                                      Text(
                                    "rejected",
                                    style: TextStyle(color: Colors.red),
                                  )
                                  // ),
                                  )
                              : widget.status2 == "delivered"
                                  ? Container(
                                      width: 0.2 * width,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.green),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color:
                                                              Colors.green)))),
                                          onPressed: () {},
                                          child: Text(
                                            "delivered",
                                            // style: TextStyle(color: Colors.green),
                                          )),
                                    )
                                  : Container(
                                      width: 0.5 * widget.width,
                                      child: DropdownButton<String>(
                                        value: selected == null
                                            ? widget.status1
                                            : selected,
                                        items: <String>[
                                          // post[0]['status'],
                                          'pending',
                                          'delivering',
                                          // 'delivered',
                                          'delivered'
                                        ].map((value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) async {
                                          setState(() => selected = value);

                                          if (widget.status2 != "delivered" &&
                                              selected == "delivered") {
                                            var revenue = 0;
                                            try {
                                              await FirebaseFirestore.instance
                                                  .collection('revenue')
                                                  .doc(widget.userid)
                                                  .get()
                                                  .then((DocumentSnapshot
                                                      documentSnapshot) {
                                                // if (documentSnapshot.exists) {
                                                print(
                                                    'Document data: ${documentSnapshot.data()}');
                                                Map<String, dynamic> data =
                                                    documentSnapshot.data()!
                                                        as Map<String, dynamic>;

                                                setState(() {
                                                  revenue = data["revenue"];
                                                });
                                                // } else {
                                                //   print('Document does not exist on the database');
                                                // }
                                              });
                                            } catch (e) {}

                                            var total = revenue + widget.total;
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
                                            if (mounted) {
                                              setState(() =>
                                                  widget.status2 = value!);
                                            }
                                            //add to revenue
                                          } else if (widget.status2 ==
                                                  "delivered" &&
                                              selected != "delivered") {
                                            var revenue = 0;
                                            try {
                                              await FirebaseFirestore.instance
                                                  .collection('revenue')
                                                  .doc(widget.userid)
                                                  .get()
                                                  .then((DocumentSnapshot
                                                      documentSnapshot) {
                                                // if (documentSnapshot.exists) {
                                                print(
                                                    'Document data: ${documentSnapshot.data()}');
                                                Map<String, dynamic> data =
                                                    documentSnapshot.data()!
                                                        as Map<String, dynamic>;

                                                setState(() {
                                                  revenue = data["revenue"];
                                                });
                                                // } else {
                                                //   print('Document does not exist on the database');
                                                // }
                                              });
                                            } catch (e) {}

                                            var total = revenue - widget.total;

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
                                            if (mounted) {
                                              setState(() =>
                                                  widget.status2 = value!);
                                            }
                                            //remove to revenue
                                          } else {
                                            if (mounted) {
                                              setState(() =>
                                                  widget.status2 = value!);
                                            }
                                          }

                                          // try {
                                          await FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(widget.userid)
                                              .collection("orders")
                                              .doc(widget.id)
                                              .update({"status": selected});
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
                                    builder: (context) => Orderview(
                                          widget.image,widget.name,widget.alt,widget.phoneNumber,widget.orderId,widget.status,widget.price,widget.quantity,widget.address,
                                        )),
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
