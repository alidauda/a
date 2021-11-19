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
import 'succesfulorders.dart';
import 'theme/light_color.dart';
import 'theme/text_styles.dart';
User? userid = FirebaseAuth.instance.currentUser;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                height: 0.35 * height,
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
                                  username == null ? 'Loading name' : username,),
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
                                        Text(
                                          "Your total revenue is",
                                          style: TextStyle(color: Colors.green),
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
                Container(
                  //  height: 0.4 * height,

                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Successfulorders(userid!.uid)),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   "Your total revenue is",
                        //   style: TextStyle(color: Colors.green),
                        // ),
                        Text(
                          "succesful orders",
                          style: TextStyle(
                              fontSize: 0.03 * height, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  height: 0.25 * height,
                  width: 0.5 * width,
                ),
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
              width: 0.4 * width,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)))),
                  onPressed: () {
                    Share.share(
                        'check out my website https://www.shopity.me/$username');

                    //                              Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => Orderview(widget.post)),
                    // );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.share_outlined,
                        color: Colors.green,
                      ),
                      Text(
                        "shre shop",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
