// import 'dart:io';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:uuid/uuid.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class Create extends StatefulWidget {
//   final userid;

//   Create(this.userid, {Key? key}) : super(key: key);

//   @override
//   _CreateState createState() => _CreateState(userid);
// }

// class _CreateState extends State<Create> {
//   var statusid = Uuid().v4();

//   final userid;
//   _CreateState(this.userid);
//   final ImagePicker _picker = ImagePicker();
//   TextEditingController namecontroller = new TextEditingController();
//   TextEditingController descontroller = new TextEditingController();
//   TextEditingController locationcontroller = new TextEditingController();
//   List listofimages = [];
//   var turn = false;
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return ModalProgressHUD(
//       inAsyncCall: turn,
//       child: SafeArea(
//         child: Container(
//           height: 0.9 * height,
//           width: 1 * width,
//           child: ListView(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: 0.12 * height,
//                     width: 0.8 * width,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         listofimages.isEmpty
//                             ? Center(
//                                 child: Row(
//                                   children: [
//                                     Text("click on"),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 8.0, right: 8.0),
//                                       child: Icon(Icons.add_a_photo),
//                                     ),
//                                     Text(" to add item image")
//                                   ],
//                                 ),
//                               )
//                             : Container(),
//                         for (var item in listofimages)
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                                 height: 0.1 * height,
//                                 width: 0.1 * width,
//                                 child: Image.file(
//                                   File(item),
//                                 )),
//                           )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 0.12 * height,
//                     width: 0.2 * width,
//                     child: TextButton(
//                         style: ButtonStyle(
//                           foregroundColor:
//                               MaterialStateProperty.all<Color>(Colors.blue),
//                         ),
//                         onPressed: () async {
//                           final List<XFile>? images =
//                               await _picker.pickMultiImage();
//                           for (XFile item in images!) {
//                             setState(() {
//                               listofimages.add(item.path);
//                             });
//                           }
//                         },
//                         child: Icon(Icons.add_a_photo)),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.all(15),
//                 child: TextField(
//                   controller: namecontroller,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'School Name',
//                     hintText: 'Enter schoolname Name',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(15),
//                 child: TextField(
//                   controller: descontroller,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'school Description',
//                     hintText: 'Enter school Description',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(15),
//                 child: TextField(
//                   controller: locationcontroller,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'school location',
//                     hintText: 'Enter school location',
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 0.12 * height,
//                 width: 0.1 * width,
//               ),
//               Container(
//                 //  height: 0.12*height,
//                 width: 0.6 * width,
//                 child: Center(
//                   child: ElevatedButton.icon(
//                     label: Text('Create forum'),
//                     icon: Icon(Icons.arrow_forward_ios_rounded),
//                     onPressed: () async {
//                       if (listofimages.isEmpty) {
//                         Fluttertoast.showToast(
//                             msg: "you must choose atleast 1 image'",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.red,
//                             textColor: Colors.white,
//                             fontSize: 16.0);

//                         return;
//                       }

//                       if (listofimages.isEmpty ||
//                           namecontroller.text.isEmpty ||
//                           descontroller.text.isEmpty) {
//                         Fluttertoast.showToast(
//                             msg: 'no field can be empty',
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.red,
//                             textColor: Colors.white,
//                             fontSize: 16.0);

//                         return;
//                       }
//                       setState(() {
//                         turn = true;
//                       });
//                       List oflinks = [];

//                       for (var item in listofimages) {
//                         try {
//                           UploadTask uploadTask = FirebaseStorage.instance
//                               .ref()
//                               .child("cloudpost_$statusid.jpg")
//                               .putFile(File(item));
//                           TaskSnapshot storageSnap =
//                               await uploadTask.whenComplete(() => null);
//                           String downloadUrl =
//                               await storageSnap.ref.getDownloadURL();

//                           setState(() {
//                             statusid = Uuid().v4();
//                             oflinks.add(downloadUrl);
//                           });
//                         } on FirebaseException catch (error) {
//                           setState(() {
//                             turn = false;
//                           });
//                           print(error);

//                           Fluttertoast.showToast(
//                               msg: error.toString(),
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.CENTER,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               fontSize: 16.0);

//                           return;
//                         } catch (e) {
//                           setState(() {
//                             turn = false;
//                           });

//                           Fluttertoast.showToast(
//                               msg: e.toString(),
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.CENTER,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               fontSize: 16.0);

//                           return;
//                         }
//                       }

//                       try {
//                         var id;
//                         await FirebaseFirestore.instance
//                             .collection("forums")
//                             .add({
//                           "name": namecontroller.text,
//                           "description": descontroller.text,
//                           "location": locationcontroller.text,
//                           "images": oflinks,
//                           "time": 7
//                         }).then((value) {
//                           id = value.id;
//                         });

//                         var adminname;
//                         var username;
//                         var profile;

//                         FirebaseFirestore.instance
//                             .collection("users")
//                             .doc(userid)
//                             .get()
//                             .then((value) async {
//                           adminname = value.data()!["fullname"];
//                           username = value.data()!["username"];
//                           profile = value.data()!["profile"];

//                           await FirebaseFirestore.instance
//                               .collection("forums")
//                               .doc(id)
//                               .collection("members")
//                               .doc(userid)
//                               .set({
//                             "id": userid,
//                             "role": "administrator",
//                             "fullname": value.data()!["fullname"],
//                             "username": value.data()!["username"],
//                             "profile": value.data()!["profile"],
//                           }).then((value) {
//                             // id = value.id;
//                           });
//                         });
//                       } catch (e) {
//                         setState(() {
//                           turn = false;
//                         });

//                         Fluttertoast.showToast(
//                             msg: e.toString(),
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.red,
//                             textColor: Colors.white,
//                             fontSize: 16.0);

//                         return;
//                       }
//                       Fluttertoast.showToast(
//                           msg: "Done".toString(),
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.CENTER,
//                           timeInSecForIosWeb: 1,
//                           backgroundColor: Colors.red,
//                           textColor: Colors.white,
//                           fontSize: 16.0);
//                       setState(() {
//                         turn = false;
//                       });

//                       print('Pressed');
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
