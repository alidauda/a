// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'theme/extention.dart';
// import 'orderviewpage.dart';
// import 'theme/light_color.dart';
// import 'theme/text_styles.dart';
// User? userid = FirebaseAuth.instance.currentUser;
// var type;

// class Myorders extends StatefulWidget {
  

//   @override
//   _MyordersState createState() => _MyordersState();
// }

// class _MyordersState extends State<Myorders> {
  
//   add() async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(userid!.uid)
//         .collection("orders")
//         .add({
//       "customerid": "asa",
//       "total": 4000,
//       "status": "pending",
//       'post': [
//         {
//           "content": "kai ka siyo min abbin nan",
//           "createdAt": "21, Dec,2021",
//           "status": "delivering",
//           "username": "ali d"
//         },
//         {
//           "content": "kai ka siyo min abbin nan",
//           "createdAt": "21, Dec,2021",
//           "status": "delivered",
//           "username": "ali d"
//         },
//         {
//           "content": "kai ka siyo min abbin nan",
//           "createdAt": "21, Dec,2021",
//           "status": "pending",
//           "username": "ali d"
//         },
//       ]
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     // add();
//     // add();
//     // add();
//     // add();
//     // add();
//     // add();
//     // add();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//                     height: 0.8 * height,

//           child: ListView(
//             children: [
//               Container(
//                   width: 0.9 * width,
//                   height: 0.1 * height,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         Container(
//                           width: 0.25 * width,
//                           child: Center(
//                             child: ElevatedButton(
//                               style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white),
//                                   shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(18.0),
//                                           side:
//                                               BorderSide(color: Colors.green)))),
//                               onPressed: () {
//                                 setState(() {
//                                   type = null;
//                                 });
//                                 // Share.share(
//                                 //     'check out my website https://www.shopity.me/$username');

//                                 //                              Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => Orderview(widget.post)),
//                                 // );
//                               },
//                               child: Text(
//                                 "all",
//                                 style: TextStyle(color: Colors.green),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 0.32 * width,
//                           child: Center(
//                             child: ElevatedButton(
//                                 style: ButtonStyle(
//                                     backgroundColor:
//                                         MaterialStateProperty.all<Color>(
//                                             Colors.white),
//                                     shape: MaterialStateProperty.all<
//                                             RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(18.0),
//                                             side: BorderSide(
//                                                 color: Colors.green)))),
//                                 onPressed: () {
//                                   setState(() {
//                                     type = "delivering";
//                                   });
//                                   // Share.share(
//                                   //     'check out my website https://www.shopity.me/$username');

//                                   //                              Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //       builder: (context) => Orderview(widget.post)),
//                                   // );
//                                 },
//                                 child: Text(
//                                   "delivering",
//                                   style: TextStyle(color: Colors.green),
//                                 )),
//                           ),
//                         ),
//                         Container(
//                           width: 0.22 * width,
//                           child: Center(
//                             child: ElevatedButton(
//                                 style: ButtonStyle(
//                                     backgroundColor:
//                                         MaterialStateProperty.all<Color>(
//                                             Colors.white),
//                                     shape: MaterialStateProperty.all<
//                                             RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(18.0),
//                                             side: BorderSide(
//                                                 color: Colors.green)))),
//                                 onPressed: () {
//                                   setState(() {
//                                     type = "delivered";
//                                   });
//                                   // Share.share(
//                                   //     'check out my website https://www.shopity.me/$username');

//                                   //                              Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //       builder: (context) => Orderview(widget.post)),
//                                   // );
//                                 },
//                                 child: Text(
//                                   "delivered",
//                                   style: TextStyle(color: Colors.green),
//                                 )),
//                           ),
//                         ),
//                         // Container(
//                         //   width: 0.22 * width,
//                         //   child: Center(
//                         //     child: ElevatedButton(
//                         //         style: ButtonStyle(
//                         //             backgroundColor:
//                         //                 MaterialStateProperty.all<Color>(Colors.white),
//                         //             shape:
//                         //                 MaterialStateProperty.all<RoundedRectangleBorder>(
//                         //                     RoundedRectangleBorder(
//                         //                         borderRadius: BorderRadius.circular(18.0),
//                         //                         side: BorderSide(color: Colors.green)))),
//                         //         onPressed: () {
//                         //           // Share.share(
//                         //           //     'check out my website https://www.shopity.me/$username');

//                         //           //                              Navigator.push(
//                         //           //   context,
//                         //           //   MaterialPageRoute(
//                         //           //       builder: (context) => Orderview(widget.post)),
//                         //           // );
//                         //         },
//                         //         child:   Text(
//                         //               "accepted",
//                         //               style: TextStyle(color: Colors.green),
//                         //             )),
//                         //   ),
//                         // ),Container(
//                         //   width: 0.22 * width,
//                         //   child: Center(
//                         //     child: ElevatedButton(
//                         //         style: ButtonStyle(
//                         //             backgroundColor:
//                         //                 MaterialStateProperty.all<Color>(Colors.white),
//                         //             shape:
//                         //                 MaterialStateProperty.all<RoundedRectangleBorder>(
//                         //                     RoundedRectangleBorder(
//                         //                         borderRadius: BorderRadius.circular(18.0),
//                         //                         side: BorderSide(color: Colors.green)))),
//                         //         onPressed: () {
//                         //           // Share.share(
//                         //           //     'check out my website https://www.shopity.me/$username');

//                         //           //                              Navigator.push(
//                         //           //   context,
//                         //           //   MaterialPageRoute(
//                         //           //       builder: (context) => Orderview(widget.post)),
//                         //           // );
//                         //         },
//                         //         child:   Text(
//                         //               "rejected",
//                         //               style: TextStyle(color: Colors.green),
//                         //             )),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               Container(
//                 // width: 0,
//                 height: 0.7*height,
//                 child: StreamBuilder(
//                     stream: type==null?FirebaseFirestore.instance
//                                 .collection("users")
//                                 .doc(userid!.uid)
//                                 .collection("orders")
//                                 .snapshots():FirebaseFirestore.instance
//                                 .collection("users")
//                                 .doc(userid!.uid)
//                                 .collection("orders").where("status", isEqualTo: type)
//                                 .snapshots(),
//                     builder:
//                         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                       if (!snapshot.hasData) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }

//                       return ListView(children: [
//                         ...snapshot.data!.docs.map((document) {
//                              var post, total, status, accepted,image,quan;

//                             try {
//                               setState(() {
//                                 post = document['post'];
//                                 total = document['total'];
//                                 accepted = document['accepted'];
//                                 status = document['status'];
//                                 quan = document['quantity'];
//                                 image = document['image'][0]["image"];
//                                 print(post);
//                               });
//                             } catch (e) {}
//                           Color randomColor() {
//                             var random = Random();
//                             final colorList = [
//                               Theme.of(context).primaryColor,
//                               LightColor.orange,
//                               LightColor.green,
//                               LightColor.grey,
//                               LightColor.lightOrange,
//                               LightColor.skyBlue,
//                               LightColor.titleTextColor,
//                               Colors.red,
//                               Colors.brown,
//                               LightColor.purpleExtraLight,
//                               LightColor.skyBlue,
//                             ];
//                             var color = colorList[random.nextInt(colorList.length)];
//                             return color;
//                           }

//                           // return Text(post.toString());
//                           return Mycontainer(
//                             height: height,
//                             post: post,
//                             width: width,
//                             id: document.id,
//                             userid: userid!.uid,
//                             status1: status,
//                             total: total,
//                             status2: status,
//                             accepted: accepted,
//                             image: image,
//                             quan: quan,
//                           );
//                           // return Container(
//                           // height: double.maxFinite,
//                           //   child: ListView.builder(
//                           //     shrinkWrap: true,
//                           //     itemCount: post.length,
//                           //     itemBuilder: (BuildContext context, int index) {
//                           //       // return Container(
//                           //       //                         height: 0.3*height,

//                           //       //   child: Column(
//                           //       //     children: [
//                           //       //       ListTile(
//                           //       //         title: Text(post[index]['username'] +
//                           //       //             "ordered" +
//                           //       //             post[index]['content']),
//                           //       //         subtitle:
//                           //       //             Text('at' + post[index]['createdAt']),
//                           //       //       ),
//                           //       //       Container(

//                           //       //   width: 0.9*width,
//                           //       //                         // height: 0.2*height,
//                           //       //         child: ListTile(
//                           //       //           title: Container(
//                           //       //              width: 0.5*width,
//                           //       //             child: DropdownButton<String>(
//                           //       //               items: <String>[
//                           //       //                 post[index]['status'],
//                           //       //                 'pending',
//                           //       //                 'delivering',
//                           //       //                 'delivered',
//                           //       //                 'recieved'
//                           //       //               ].map((String value) {
//                           //       //                 return DropdownMenuItem<String>(
//                           //       //                   value: value,
//                           //       //                   child: Text(value),
//                           //       //                 );
//                           //       //               }).toList(),
//                           //       //               onChanged: (_) {},
//                           //       //             ),
//                           //       //           ),
//                           //       //           trailing: Container(
//                           //       //              width: 0.2*width,
//                           //       //             child: ElevatedButton(
//                           //       //                 style: ButtonStyle(
//                           //       //                     shape: MaterialStateProperty.all<
//                           //       //                             RoundedRectangleBorder>(
//                           //       //                         RoundedRectangleBorder(
//                           //       //                             borderRadius:
//                           //       //                                 BorderRadius.circular(
//                           //       //                                     18.0),
//                           //       //                             side: BorderSide(
//                           //       //                                 color: Colors.red)))),
//                           //       //                 onPressed: () {},
//                           //       //                 child: Text(
//                           //       //                   "view",
//                           //       //                   style: TextStyle(color: Colors.orange),
//                           //       //                 )),
//                           //       //           ),
//                           //       //         ),
//                           //       //       )
//                           //       //     ],
//                           //       //   ),
//                           //       // );
//                           //     },
//                           //   ),
//                           // );
//                         }).toList(),
//                       ]);
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Mycontainer extends StatefulWidget {
//   Mycontainer({
//     Key? key,
//     required this.height,
//     required this.post,
//     required this.width,
//     required this.id,
//     required this.userid,
//     required this.total,
//     required this.status2,
//     required this.status1,
//     required this.accepted,
//     required this.image,
//     required this.quan,
    

//     // required this.selected,
//   }) : super(key: key);

//   final double height;
//   final post;
//   final double width;
//   final id;
//   final userid;
//   // final String? selected;
//   var total;
//   var status2;
//   var status1, accepted,image,quan;

//   @override
//   _MycontainerState createState() => _MycontainerState();
// }

// class _MycontainerState extends State<Mycontainer> {
//   String? selected;

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Container(
//       height: 0.22 * widget.height,
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                   offset: Offset(4, 4),
//                   blurRadius: 10,
//                   color: LightColor.grey.withOpacity(.2),
//                 ),
//                 BoxShadow(
//                   offset: Offset(-3, 0),
//                   blurRadius: 15,
//                   color: LightColor.grey.withOpacity(.1),
//                 )
//               ],
//             ),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//               child: Column(
//                 children: [
//                   ListTile(
//                     trailing:Text(widget.quan==null?"1":widget.quan.toString()),
//                     leading: ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(13)),
//             child: Container(
//               height: 55,
//               width: 55,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 // color: Colors.green,
//               ),
//               child: 
//               widget.image==null?Icon(Icons.category_sharp):Image.network(
              
                
//     widget.image,
//                 height: 50,
//                 width: 50,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//                     title: Text("order #" + widget.id),
//                     //  Text(widget.post[0]['username'] +
//                     //     "ordered" +
//                     //     widget.post[0]['content']),
//                   ),
//                   Container(
//                     width: 0.9 * widget.width,
//                     // height: 0.2*height,
//                     child: ListTile(
                      
//                       title: widget.accepted == null
//                           ? Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 18, vertical: 8),
//                               // child:  Padding(
//                               // padding: const EdgeInsets.only(left: 40,right: 40),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     width: 0.2 * width,
//                                     child: ElevatedButton(
//                                         style: ButtonStyle(
//                                             backgroundColor:
//                                                 MaterialStateProperty.all<
//                                                     Color>(Colors.red),
//                                             shape: MaterialStateProperty.all<
//                                                     RoundedRectangleBorder>(
//                                                 RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             18.0),
//                                                     side: BorderSide(
//                                                         color: Colors.red)))),
//                                         onPressed: () async {
//                                           // try {
//                                           await FirebaseFirestore.instance
//                                               .collection("users")
//                                               .doc(widget.userid)
//                                               .collection("orders")
//                                               .doc(widget.id)
//                                               .update({"accepted": false});
//                                         },
//                                         child: Text(
//                                           "reject",
//                                           // style: TextStyle(color: Colors.green),
//                                         )),
//                                   ),
//                                   Container(
//                                     width: 0.2 * width,
//                                     child: ElevatedButton(
//                                         style: ButtonStyle(
//                                             backgroundColor:
//                                                 MaterialStateProperty.all<
//                                                     Color>(Colors.green),
//                                             shape: MaterialStateProperty.all<
//                                                     RoundedRectangleBorder>(
//                                                 RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             18.0),
//                                                     side: BorderSide(
//                                                         color: Colors.green)))),
//                                         onPressed: () async {
//                                           await FirebaseFirestore.instance
//                                               .collection("users")
//                                               .doc(widget.userid)
//                                               .collection("orders")
//                                               .doc(widget.id)
//                                               .update({"accepted": true});
//                                         },
//                                         child: Text(
//                                           "accept",
//                                           // style: TextStyle(color: Colors.green),
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                               // ,
//                             )
//                           : widget.accepted == false
//                               ? Container(
//                                   width: 0.2 * width,
//                                   child: 
//                                   // ElevatedButton(
                                
//                                       // onPressed: () {},
//                                       // child:
//                                        Text(
//                                         "rejected",style: TextStyle(color: Colors.red),
//                                       )
//                                       // ),
//                                 )
//                               : widget.status2 == "delivered"
//                                   ? Container(
//                                       width: 0.2 * width,
//                                       child: ElevatedButton(
//                                           style: ButtonStyle(
//                                               backgroundColor:
//                                                   MaterialStateProperty.all<
//                                                       Color>(Colors.green),
//                                               shape: MaterialStateProperty.all<
//                                                       RoundedRectangleBorder>(
//                                                   RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               18.0),
//                                                       side: BorderSide(
//                                                           color:
//                                                               Colors.green)))),
//                                           onPressed: () {},
//                                           child: Text(
//                                             "delivered",
//                                             // style: TextStyle(color: Colors.green),
//                                           )),
//                                     )
//                                   : Container(
//                                       width: 0.5 * widget.width,
//                                       child: DropdownButton<String>(
//                                         value: selected == null
//                                             ? widget.status1
//                                             : selected,
//                                         items: <String>[
//                                           // post[0]['status'],
//                                           'pending',
//                                           'delivering',
//                                           // 'delivered',
//                                           'delivered'
//                                         ].map((value) {
//                                           return DropdownMenuItem<String>(
//                                             value: value,
//                                             child: Text(value),
//                                           );
//                                         }).toList(),
//                                         onChanged: (value) async {
//                                           setState(() => selected = value);

//                                           if (widget.status2 != "delivered" &&
//                                               selected == "delivered") {
//                                             var revenue = 0;
//                                             try {
//                                               await FirebaseFirestore.instance
//                                                   .collection('revenue')
//                                                   .doc(widget.userid)
//                                                   .get()
//                                                   .then((DocumentSnapshot
//                                                       documentSnapshot) {
//                                                 // if (documentSnapshot.exists) {
//                                                 print(
//                                                     'Document data: ${documentSnapshot.data()}');
//                                                 Map<String, dynamic> data =
//                                                     documentSnapshot.data()!
//                                                         as Map<String, dynamic>;

//                                                 setState(() {
//                                                   revenue = data["revenue"];
//                                                 });
//                                                 // } else {
//                                                 //   print('Document does not exist on the database');
//                                                 // }
//                                               });
//                                             } catch (e) {}

//                                             var total = revenue + widget.total;
//                                             try {
//                                               await FirebaseFirestore.instance
//                                                   .collection('revenue')
//                                                   .doc(widget.userid)
//                                                   .update({'revenue': total});
//                                             } catch (e) {
//                                               await FirebaseFirestore.instance
//                                                   .collection('revenue')
//                                                   .doc(widget.userid)
//                                                   .set({'revenue': total});
//                                             }
//                                             if (mounted) {
//                                               setState(() =>
//                                                   widget.status2 = value!);
//                                             }
//                                             //add to revenue
//                                           } else if (widget.status2 ==
//                                                   "delivered" &&
//                                               selected != "delivered") {
//                                             var revenue = 0;
//                                             try {
//                                               await FirebaseFirestore.instance
//                                                   .collection('revenue')
//                                                   .doc(widget.userid)
//                                                   .get()
//                                                   .then((DocumentSnapshot
//                                                       documentSnapshot) {
//                                                 // if (documentSnapshot.exists) {
//                                                 print(
//                                                     'Document data: ${documentSnapshot.data()}');
//                                                 Map<String, dynamic> data =
//                                                     documentSnapshot.data()!
//                                                         as Map<String, dynamic>;

//                                                 setState(() {
//                                                   revenue = data["revenue"];
//                                                 });
//                                                 // } else {
//                                                 //   print('Document does not exist on the database');
//                                                 // }
//                                               });
//                                             } catch (e) {}

//                                             var total = revenue - widget.total;

//                                             try {
//                                               await FirebaseFirestore.instance
//                                                   .collection('revenue')
//                                                   .doc(widget.userid)
//                                                   .update({'revenue': total});
//                                             } catch (e) {
//                                               await FirebaseFirestore.instance
//                                                   .collection('revenue')
//                                                   .doc(widget.userid)
//                                                   .set({'revenue': total});
//                                             }
//                                             if (mounted) {
//                                               setState(() =>
//                                                   widget.status2 = value!);
//                                             }
//                                             //remove to revenue
//                                           } else {
//                                             if (mounted) {
//                                               setState(() =>
//                                                   widget.status2 = value!);
//                                             }
//                                           }

//                                           // try {
//                                           await FirebaseFirestore.instance
//                                               .collection("users")
//                                               .doc(widget.userid)
//                                               .collection("orders")
//                                               .doc(widget.id)
//                                               .update({"status": selected});
//                                           // } catch (e) {

//                                           // }
//                                         },
//                                       ),
//                                     ),
//                       trailing: Container(
//                         width: 0.2 * widget.width,
//                         child: ElevatedButton(
//                             style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.white),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(18.0),
//                                         side:
//                                             BorderSide(color: Colors.green)))),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         Orderview(widget.post)),
//                               );
//                             },
//                             child: Text(
//                               "view",
//                               style: TextStyle(color: Colors.green),
//                             )),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'theme/light_color.dart';

// class Orderview extends StatefulWidget {
//   var post,userid,id;
//   Orderview(this.post,this.userid,id);

//   @override
//   _OrderviewState createState() => _OrderviewState(post);
// }

// class _OrderviewState extends State<Orderview> {
//   var post;
// _OrderviewState(this.post);
//   @override
//   Widget build(BuildContext context) {

//         var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.green[400],title: Center(child: Text("order")),),
//       body: SafeArea(
//         child: Column(
//           children: [
         
//             Container(
//               width: 0.99*width,
//               height: 0.75*height,
//               child: ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: post.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Container(
//                                                         // height: 0.5*height,
          
//                                   child: Column(
//                                     children: [
//                   //                      Container(
//                   //   height: 0.3*height,
//                   //   width: 0.9*width,
//                   //   child: ListView(
//                   //     children: [
//                   //                    for(var item in data['images'] ) Padding(
//                   //                      padding: const EdgeInsets.all(8.0),
//                   //                      child: CachedNetworkImage(imageUrl: item),
//                   //                    )
          
//                   //     ],
//                   //   ),
          
//                   // ),
//                                       ListTile(
//                                         title: Text(post[index]['name'] +
//                                             " ordered " +
//                                             post[index]['alt']),
//                                         trailing: GestureDetector(
//                                           onTap: () async { 
//                                             setState(() {
//                                               if (post[index]['rejected']==true) {
//                                                   post[index]['rejected']=false;

//                                               }
//                                               else{
//                                                   post[index]['rejected']=true;

//                                               }
                                    

                                            
//                                             });   

//                                                await FirebaseFirestore.instance
//                                               .collection("users")
//                                               .doc(widget.userid)
//                                               .collection("orders")
//                                               .doc("I7t3kUY7GPKZsubhWOK2")
//                                               .update({"Post": post});},
//                                           child: post[index]['rejected']!=true?Icon(Icons.cancel):Icon(Icons.security_update_good)),
//                                         // subtitle:
//                                         //     Text('at' + post[index]['createdAt']),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Divider(color:Colors.green),
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               },
//                             ),
//             ),

//     //         Container(
//     //   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//     //   decoration: BoxDecoration(
//     //     color: Colors.white,
//     //     borderRadius: BorderRadius.all(Radius.circular(20)),
//     //     boxShadow: <BoxShadow>[
//     //       BoxShadow(
//     //         offset: Offset(4, 4),
//     //         blurRadius: 10,
//     //         color: LightColor.grey.withOpacity(.2),
//     //       ),
//     //       BoxShadow(
//     //         offset: Offset(-3, 0),
//     //         blurRadius: 15,
//     //         color: LightColor.grey.withOpacity(.1),
//     //       )
//     //     ],
//     //   ),
//     //   child: Container(
//     //     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
//     //     child:  Padding(
//     //           padding: const EdgeInsets.only(left: 40,right: 40),
//     //           child: Row(
//     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //             children: [
//     //              Container(
//     //                                        width: 0.2*width,
//     //                                       child: ElevatedButton(
          
//     //                                           style: ButtonStyle(
//     //                                                   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          
//     //                                               shape: MaterialStateProperty.all<
//     //                                                       RoundedRectangleBorder>(
//     //                                                   RoundedRectangleBorder(
//     //                                                       borderRadius:
//     //                                                           BorderRadius.circular(
//     //                                                               18.0),
//     //                                                       side: BorderSide(
//     //                                                           color: Colors.red)))),
//     //                                           onPressed: () {},
//     //                                           child: Text(
//     //                                             "reject",
//     //                                             // style: TextStyle(color: Colors.green),
//     //                                           )),
//     //                                     ), Container(
//     //                                        width: 0.2*width,
//     //                                       child: ElevatedButton(
          
//     //                                           style: ButtonStyle(
//     //                                                   backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          
//     //                                               shape: MaterialStateProperty.all<
//     //                                                       RoundedRectangleBorder>(
//     //                                                   RoundedRectangleBorder(
//     //                                                       borderRadius:
//     //                                                           BorderRadius.circular(
//     //                                                               18.0),
//     //                                                       side: BorderSide(
//     //                                                           color: Colors.green)))),
//     //                                           onPressed: () {},
//     //                                           child: Text(
//     //                                             "accept",
//     //                                             // style: TextStyle(color: Colors.green),
//     //                                           )),
//     //                                     ),
//     //           ],),
//     //         ),
        
//     //   ),
//     // ),
             
//           ],
//         ),
//       ),
//     );
//   }
// }