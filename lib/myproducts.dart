// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:google_fonts/google_fonts.dart';

// class Forumpage extends StatefulWidget {
//   var userid;
//   Forumpage(this.userid);
//   @override
//   _ForumpageState createState() =>
//       _ForumpageState(userid);
// }

// class _ForumpageState extends State<Forumpage> {
//   _ForumpageState(this.userid,);
//   var userid;
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.orange[50],
//         onPressed: () {
//           showModalBottomSheet(
//               isScrollControlled: true,
//               context: context,
//               builder: (context) {
//                 return Container(
//                     height: 0.7 * height, child: Addquestion(userid, forumid));
//               });
//         },
//         child: Icon(
//           Icons.add,
//           color: Colors.orange,
//         ),
//       ),
//       body: SafeArea(
//         child: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection("UserProduct").doc(userid).collection("myitems")
//                 .snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (!snapshot.hasData) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }

//               return ListView(children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: 0.92 * width,
//                       height: 0.1 * height,
//                       child: ListTile(
//                         leading: Container(
//                           child: TextButton(
//                             child: Icon(
//                               Icons.arrow_back_ios,
//                               color: Colors.orange,
//                             ),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ),
//                         subtitle: Text(
//                           "all my items".toString(),
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 25,
//                               color: Colors.orange,
//                               fontStyle: FontStyle.italic),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 ...snapshot.data!.docs.map((document) {
//                   var profile;
//                   try {
//                     profile = document['profile'];
//                   } catch (e) {}


//                   String name = document['name'];
//                   String description = document['description'];
//                   String discount = document['discount'];
//                   String price = document['price'];
//                   String images = document['images'];
//                   String userid = document['userid'];

//                   // String username = document['username'];
//                   // String forumid = document['forumid'];
//                   // String question = document['question'];
//                   // String qid = document.id;
//                   return GestureDetector(
//                     onTap: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => Questionview(
//                       //           userid,
//                       //           forumid,
//                       //           {
//                       //             "fullname": fullname,
//                       //             "username": username,
//                       //             "question": question,
//                       //             "profile": profile
//                       //           },
//                       //           qid,
//                       //           qid,
//                       //           role)),
//                       // );
//                     },
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               height: 0.1 * height,
//                               width: 0.99 * width,
//                               child: Cachenetwork,
//                             )
//                           ],
//                         ),
//                         // Text(category),
                   
                         
//                             Container(
//                                 width: 0.82 * width,
//                                 child: Text(price.toString()
//                                 )),
//                           ListTile(
//                                   trailing: Container(
//                                   height: 0.05 * height,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     color: Colors.orange[50],
//                                   ),
//                                   child: Center(
//                                       child: Text(
//                                     "view",
//                                     style: TextStyle(color: Colors.orange),
//                                   )),
//                                   width: 0.2 * width,
//                                 ),
//                           ),

//                         Divider()
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ]);
//             }),
//       ),
//     );
//   }
// }
