import 'dart:io';

import 'home_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

User _userid = FirebaseAuth.instance.currentUser!;

class Create extends StatefulWidget {
  static const routeName = "/addProduct";

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {

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
        .doc(_userid.uid)
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
  void initState(){
    super.initState();
    getuser();
  }

void dispose() {
  super.dispose();
 getuser();
}
  TextEditingController discountcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController descontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  TextEditingController qcontroller = new TextEditingController();
  var statusid = Uuid().v4();

  var _isloading = false;

  final ImagePicker _picker = ImagePicker();

  List listofimages = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("Add product")),
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                height: 0.9 * height,
                width: 1 * width,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 0.12 * height,
                          width: 0.8 * width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              listofimages.isEmpty
                                  ? Center(
                                      child: Row(
                                        children: [
                                          Text("click on"),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: Icon(Icons.add_a_photo),
                                          ),
                                          Text(" to add item image")
                                        ],
                                      ),
                                    )
                                  : Container(),
                              for (var item in listofimages)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 0.1 * height,
                                      width: 0.1 * width,
                                      child:
                                          //    CircleAvatar(
                                          // radius:0.04 *width ,
                                          //     child: Text(item)),
                                          Image.file(
                                        File(item),
                                      )),
                                )
                            ],
                          ),
                        ),
                        Container(
                          height: 0.12 * height,
                          width: 0.2 * width,
                          child: TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              onPressed: () async {
                                final List<XFile>? images =
                                    await _picker.pickMultiImage();
                                for (XFile item in images!) {
                                  setState(() {
                                    listofimages.add(item.path);
                                  });
                                }
                              },
                              child: Icon(Icons.add_a_photo)),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Item Name',
                          hintText: 'Enter Item Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: descontroller,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Item Description',
                          hintText: 'Enter Item Description',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: pricecontroller,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Item price',
                          hintText: 'Enter Item price',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: qcontroller,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Item quantity',
                          hintText: 'Enter quantity',
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(15),
                    //   child: TextField(
                    //     controller: discountcontroller,
                    //     decoration: InputDecoration(
                    //       //border: OutlineInputBorder(),
                    //       labelText: 'Item Discount (optional)',
                    //       hintText: 'Enter Item Discount (optional)',
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 0.12 * height,
                      width: 0.1 * width,
                    ),
                    Container(
                      //  height: 0.12*height,
                      width: 0.6 * width,
                      child: Center(
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          label: Text('Create Item'),
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                          onPressed: () async {
                            setState(() {
                              _isloading = true;
                            });
                            if (listofimages.isEmpty) {
                              final snackBar = SnackBar(
                                  content:
                                      Text('you must choose atleast 1 image'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              return;
                            }

                            if (namecontroller.text.isEmpty ||
                                descontroller.text.isEmpty ||
                                pricecontroller.text.isEmpty) {
                              final snackBar = SnackBar(
                                  content: Text('no field can be empty'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              return;
                            }

                            List oflinks = [];

                            for (var item in listofimages) {
                              try {
                                UploadTask uploadTask = FirebaseStorage.instance
                                    .ref()
                                    .child("cloudpost_$statusid.jpg")
                                    .putFile(File(item));
                                TaskSnapshot storageSnap =
                                    await uploadTask.whenComplete(() => null);
                                String downloadUrl =
                                    await storageSnap.ref.getDownloadURL();

                                setState(() {
                                  statusid = Uuid().v4();
                                  oflinks.add(downloadUrl);
                                });
                              } on FirebaseException catch (error) {
                                print(error);
                              }
                            }
                            
                            var shopname;
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(_userid.uid)
                                .get()
                                .then((DocumentSnapshot documentSnapshot) {
                              // if (documentSnapshot.exists) {
                              print(
                                  'Document data: ${documentSnapshot.data()}');
                              Map<String, dynamic> data = documentSnapshot
                                  .data()! as Map<String, dynamic>;

                              setState(() {
                                shopname = data["shopname"];
                              });
                              // } else {
                              //   print('Document does not exist on the database');
                              // }
                            });
                            // TextEditingController discountcontroller=new TextEditingController();
                            // TextEditingController namecontroller=new TextEditingController();
                            // TextEditingController descontroller=new TextEditingController();
                            // TextEditingController pricecontroller=new TextEditingController();
                            var uuid = Uuid();
                            String slug = namecontroller.text + uuid.v4();
                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(_userid.uid)
                                .collection("items")
                                .doc(slug)
                                .set({
                              "name": namecontroller.text,
                              "description": descontroller.text,
                              // "discount": discountcontroller.text,
                              "price": int.parse(pricecontroller.text),
                              "images": oflinks,
                              "userid": _userid.uid,
                              "quantity":int.parse(qcontroller.text) ,
                              "slug": slug,
                              "alt": descontroller.text,
                              "shopname": username,
                              "published":true,
                              "shopid":    _userid.uid ,
                              "title":namecontroller.text,
                              "username":username
                                                     });
                            setState(() {
                              _isloading = false;
                            });
                            Navigator.of(context).pop();
                            print('Pressed');
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
