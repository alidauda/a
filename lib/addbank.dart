// @dart=2.9
import 'dart:io';

import 'home_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

User _userid = FirebaseAuth.instance.currentUser;

class Bankinfo extends StatefulWidget {
  static const routeName = "/addBank";

  @override
  _BankinfoState createState() => _BankinfoState();
}

class _BankinfoState extends State<Bankinfo> {
  // TextEditingController discountcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  // TextEditingController descontroller = new TextEditingController();
  TextEditingController numbercontroller = new TextEditingController();

  int mycode;
  List listofbanks = [
    'Access Bank Nigeria Plc',
    'Diamond Bank Plc',
    'Ecobank Nigeria',
    'Enterprise Bank Plc',
    'Fidelity Bank Plc',
    'First Bank of Nigeria Plc',
    'First City Monument Bank',
    'Guaranty Trust Bank Plc',
    'Heritaage Banking Company Ltd',
    'Jaiz Bank',
    'Keystone Bank Ltd',
    'Mainstreet Bank Plc',
    'Skye Bank Plc',
    'Stanbic IBTC Plc',
    'Sterling Bank Plc',
    'Union Bank Nigeria Plc',
    'United Bank for Africa Plc',
    'Unity Bank Plc',
    'WEMA Bank Plc',
    'Zenith Bank International'
  ];

  List listofbankscodes = [
    044,
    063,
    050,
    084,
    070,
    011,
    214,
    058,
    030,
    301,
    082,
    014,
    076,
    039,
    232,
    032,
    033,
    215,
    035,
    057
  ];

  var statusid = Uuid().v4();

  var _isloading = false;

  // final ImagePicker _picker = ImagePicker();

  // List listofimages = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("add bank info")),
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
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'account name',
                          hintText: 'Enter account name',
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      items: <String>[
                        'Access Bank Nigeria Plc',
                        'Diamond Bank Plc',
                        'Ecobank Nigeria',
                        'Enterprise Bank Plc',
                        'Fidelity Bank Plc',
                        'First Bank of Nigeria Plc',
                        'First City Monument Bank',
                        'Guaranty Trust Bank Plc',
                        'Heritaage Banking Company Ltd',
                        'Jaiz Bank',
                        'Keystone Bank Ltd',
                        'Mainstreet Bank Plc',
                        'Skye Bank Plc',
                        'Stanbic IBTC Plc',
                        'Sterling Bank Plc',
                        'Union Bank Nigeria Plc',
                        'United Bank for Africa Plc',
                        'Unity Bank Plc',
                        'WEMA Bank Plc',
                        'Zenith Bank International'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        int index = listofbanks.indexOf(value);
                        if (index<0) {
                          return;
                        }
                        setState(() {
                          mycode=listofbankscodes[index];
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: numbercontroller,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Account number',
                          hintText: 'Enter Account number',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.12 * height,
                      width: 0.1 * width,
                    ),
                    Container(
                      //  height: 0.12*height,
                      width: 0.6 * width,
                      child: Center(
                        child: ElevatedButton.icon(
                          label: Text('Create Item'),
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                          onPressed: () async {
                            setState(() {
                              _isloading = true;
                            });


                            if (mycode==null) {
                              final snackBar = SnackBar(
                                  content:
                                      Text('you must choose a valid bank'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              return;
                            }

                            if (namecontroller.text.isEmpty ||
                                // descontroller.text.isEmpty ||
                                numbercontroller.text.isEmpty) {
                              final snackBar = SnackBar(
                                  content: Text('no field can be empty'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              return;
                            }

                            // List oflinks = [];

                            // for (var item in listofimages) {
                            //   try {
                            //     UploadTask uploadTask = FirebaseStorage.instance
                            //         .ref()
                            //         .child("cloudpost_$statusid.jpg")
                            //         .putFile(File(item));
                            //     TaskSnapshot storageSnap =
                            //         await uploadTask.whenComplete(() => null);
                            //     String downloadUrl =
                            //         await storageSnap.ref.getDownloadURL();

                            //     setState(() {
                            //       statusid = Uuid().v4();
                            //       oflinks.add(downloadUrl);
                            //     });
                            //   } on FirebaseException catch (error) {
                            //     print(error);
                            //   }
                            // }

                            await FirebaseFirestore.instance
                                .collection("UserProduct")
                                .doc(_userid.uid)
                                .collection("myitems")
                                .add({
                              "name": namecontroller.text,
                              // "description": descontroller.text,
                              // "discount": discountcontroller.text,
                              "price": numbercontroller.text,
                              // "images": oflinks,
                              "userid": _userid.uid,
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
