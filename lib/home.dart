import 'dart:math';

import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:share_plus/share_plus.dart';
import 'catbar.dart';
import 'mycustomers.dart';
import 'myorders.dart';
import 'orderviewpage.dart';
import 'succesfulorders.dart';
import 'theme/light_color.dart';
import 'theme/text_styles.dart';
import 'myorders.dart';

User? userid = FirebaseAuth.instance.currentUser;
var type;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getData() async {
    try {
      await FirebaseFirestore.instance
          .collection('revenue')
          .doc(userid!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        // if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        Map<String, dynamic> data =
            documentSnapshot.data()! as Map<String, dynamic>;

        setState(() {
          revenue = data["revenue"].toString();
        });
        // } else {
        //   print('Document does not exist on the database');
        // }
      });
    } catch (e) {
      print(e);
    }
  }

  var username;
  var fullname;
  var photo;

  getuser() async {
    // print(revenue);
    // print(revenue);
    // print(revenue);
    // print(revenue);
    // print(revenue);
    // print(revenue);
    // print(revenue);
    // print(revenue);
    // print(revenue);
    FirebaseFirestore.instance
        .collection('users')
        .doc(userid!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      // if (documentSnapshot.exists) {
      print('Document data: ${documentSnapshot.data()}');
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;

      setState(() {
        username = data["shopname"];
        fullname = data["fullname"];
        photo = data["profile"];
      });
      // } else {
      //   print('Document does not exist on the database');
      // }
    });
  }

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

  @override
  void initState() {
    super.initState();
    getData();
    getuser();
    // makereq();
  }

  var revenue = "0";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 0.8 * height,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  height: 0.4 * height,
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          child: Column(
                            children: [
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: randomColor(),
                                    ),
                                    child: photo == null
                                        ? Icon(Icons.person)
                                        : Image.network(
                                            photo,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                ),
                                title: Text(
                                  username == null ? 'Loading name' : username,
                                ),
                                //  Text(widget.post[0]['username'] +
                                //     "ordered" +
                                //     widget.post[0]['content']),
                                subtitle: Text("shop name:" +
                                    username.toString() +
                                    "'s shop"),
                              ),
                              Container(
                                // height: 0.7 * height,
                                child: Center(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text( "Your total revenue is",
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                          Text(
                                            "₦ " + "${revenue.toString()}",
                                            style: TextStyle(
                                                fontSize: 0.07 * height,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: 0.15 * height,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 0.4 * width,
                                    child: Center(
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color:
                                                              Colors.green)))),
                                          onPressed: () {
                                            Share.share(
                                                'check out my website https://www.myshago.store/$username');

                                            //                              Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) => Orderview(widget.post)),
                                            // );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.share_outlined,
                                                color: Colors.green,
                                              ),
                                              Text(
                                                "share shop",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   //  height: 0.4 * height,

                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => Successfulorders(userid!.uid)),
                  //       );
                  //     },
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         // Text(
                  //         //   "Your total revenue is",
                  //         //   style: TextStyle(color: Colors.green),
                  //         // ),
                  //         Text(
                  //           "succesful orders",
                  //           style: TextStyle(
                  //               fontSize: 0.03 * height, color: Colors.green),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   height: 0.1 * height,
                  //   width: 0.5 * width,
                  // ),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Mycustomers(userid)),
                  //     );
                  //   },
                  //   child: Container(
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           "my customers",
                  //           style: TextStyle(
                  //               fontSize: 0.03 * height, color: Colors.green),
                  //         ),
                  //       ],
                  //     ),
                  //     height: 0.25 * height,
                  //     width: 0.4 * width,
                  //   ),
                  // ),
                ],
              ),
              Container(
                width: 0.9 * width,
                height: 0.1 * height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 0.25 * width,
                        child: Center(
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
                              setState(() {
                                type = null;
                              });
                              // Share.share(
                              //     'check out my website https://www.shopity.me/$username');

                              //                              Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Orderview(widget.post)),
                              // );
                            },
                            child: Text(
                              "all",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 0.32 * width,
                        child: Center(
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
                                          side: BorderSide(
                                              color: Colors.green)))),
                              onPressed: () {
                                setState(() {
                                  type = "delivering";
                                });
                                // Share.share(
                                //     'check out my website https://www.shopity.me/$username');

                                //                              Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Orderview(widget.post)),
                                // );
                              },
                              child: Text(
                                "delivering",
                                style: TextStyle(color: Colors.green),
                              )),
                        ),
                      ),
                      Container(
                        width: 0.27 * width,
                        child: Center(
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
                                          side: BorderSide(
                                              color: Colors.green)))),
                              onPressed: () {
                                setState(() {
                                  type = "delivered";
                                });
                                // Share.share(
                                //     'check out my website https://www.shopity.me/$username');

                                //                              Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Orderview(widget.post)),
                                // );
                              },
                              child: Text(
                                "delivered",
                                style: TextStyle(color: Colors.green),
                              )),
                        ),
                      ),
                      // Container(
                      //   width: 0.22 * width,
                      //   child: Center(
                      //     child: ElevatedButton(
                      //         style: ButtonStyle(
                      //             backgroundColor:
                      //                 MaterialStateProperty.all<Color>(Colors.white),
                      //             shape:
                      //                 MaterialStateProperty.all<RoundedRectangleBorder>(
                      //                     RoundedRectangleBorder(
                      //                         borderRadius: BorderRadius.circular(18.0),
                      //                         side: BorderSide(color: Colors.green)))),
                      //         onPressed: () {
                      //           // Share.share(
                      //           //     'check out my website https://www.shopity.me/$username');

                      //           //                              Navigator.push(
                      //           //   context,
                      //           //   MaterialPageRoute(
                      //           //       builder: (context) => Orderview(widget.post)),
                      //           // );
                      //         },
                      //         child:   Text(
                      //               "accepted",
                      //               style: TextStyle(color: Colors.green),
                      //             )),
                      //   ),
                      // ),Container(
                      //   width: 0.22 * width,
                      //   child: Center(
                      //     child: ElevatedButton(
                      //         style: ButtonStyle(
                      //             backgroundColor:
                      //                 MaterialStateProperty.all<Color>(Colors.white),
                      //             shape:
                      //                 MaterialStateProperty.all<RoundedRectangleBorder>(
                      //                     RoundedRectangleBorder(
                      //                         borderRadius: BorderRadius.circular(18.0),
                      //                         side: BorderSide(color: Colors.green)))),
                      //         onPressed: () {
                      //           // Share.share(
                      //           //     'check out my website https://www.shopity.me/$username');

                      //           //                              Navigator.push(
                      //           //   context,
                      //           //   MaterialPageRoute(
                      //           //       builder: (context) => Orderview(widget.post)),
                      //           // );
                      //         },
                      //         child:   Text(
                      //               "rejected",
                      //               style: TextStyle(color: Colors.green),
                      //             )),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Center(child: Text("orders")),
              Container(
                height: 0.5 * height,
                child: StreamBuilder(
                    stream: type == null
                        ? FirebaseFirestore.instance
                   .collection("orders")
                            .where("shopid", isEqualTo: userid!.uid)
                            // .collection("orders")
                            .snapshots()
                        : FirebaseFirestore.instance
               .collection("orders")
                            .where("shopid", isEqualTo: userid!.uid)
                            // .collection("orders")
                            .where("status", isEqualTo: type)
                            .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
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
                              quantity,title,
                              createdAt;

                          try {
                            // setState(() {
                              // post = document['post'];
                              try {
                                title = document["title"];
                              } catch (e) {}  
                              try {
                                createdAt = document["createdAt"];
                              } catch (e) {}
                          
                              try {
                                status = document["status"];
                              } catch (e) {}
                              try {
                                quantity = document["quantity"];
                              } catch (e) {}
                              try {
                                price = document["price"];
                              } catch (e) {}
                              try {
                                phoneNumber = document["phoneNumber"];
                              } catch (e) {}
                              try {
                                orderId = document["orderId"];
                              } catch (e) {}
                              try {
                                name = document["name"];
                              } catch (e) {}
                              try {
                                alt = document["alt"];
                              } catch (e) {}
                              try {
                                address = document["address"];
                              } catch (e) {}
                              try {
                                image = document["image"];
                              } catch (e) {}
                              try {
                                quan = document['quantity'];
                              } catch (e) {}
                              try {
                                status = document['status'];
                              } catch (e) {}
                              try {
                                accepted = document['accepted'];
                              } catch (e) {}
                              try {
                                total = document['total'];
                              } catch (e) {}
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
                            // });
                          } catch (e) {
                            final snackBar =
                                SnackBar(content: Text(e.toString()));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

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
                            title:title,
                            createdAt:createdAt,
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
                          //       //                 'delivered'
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
