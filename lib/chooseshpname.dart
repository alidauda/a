// @dart=2.9

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:uuid/uuid.dart';
// import 'home.dart';

class Choose extends StatefulWidget {
  var userid;
  Choose(this.userid, {Key key}) : super(key: key);

  @override
  _ChooseState createState() => _ChooseState(userid);
}

class _ChooseState extends State<Choose> {
  var userid;
  var image;
  bool turn = false;
  _ChooseState(this.userid);
  TextEditingController username = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: turn,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              // backgroundImage: Image.file(file),
              radius: 0.1 * height,
              backgroundColor: Colors.orange[50],
              child: image == null
                  ? InkWell(
                      onTap: () async {
                        XFile fi = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        setState(() {
                          image = fi.path;
                        });
                      },
                      child: Container(
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : Container(
                      child: Image.file(
                        File(image),
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'choose shopname',
                  hintText: 'Choose your shopname',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () async {
                  if (image == null) {
                    //  if (email.text.isEmpty||password.text.isEmpty) {
                    final snackBar = SnackBar(
                        content: Text('you must choose an profile photo'));

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    return;
                    // }
                  }
                  if (username.text.isEmpty) {
                    //  if (email.text.isEmpty||password.text.isEmpty) {
                    final snackBar =
                        SnackBar(content: Text('you must choose an shopname'));

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    return;
                    // }

                  }

                  try{
var exist=await FirebaseFirestore.instance
                        .collection("users")
                        .doc(username.text).get();
                  }catch(e){

                  }

                  var statusid = Uuid().v4();

                  setState(() {
                    turn = true;
                  });

                  try {
                    UploadTask uploadTask = FirebaseStorage.instance
                        .ref()
                        .child("cloudpost_$statusid.jpg")
                        .putFile(File(image));
                    TaskSnapshot storageSnap =
                        await uploadTask.whenComplete(() => null);
                    String downloadUrl = await storageSnap.ref.getDownloadURL();

                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(userid)
                        .update({
                      "profile": downloadUrl,
                      "shopname": username.text
                    });
                  } catch (e) {
                    setState(() {
                      turn = false;
                    });

                    final snackBar = SnackBar(content: Text(e.toString()));

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    return;
                  }
                  setState(() {
                    turn = false;
                  });
                  Uuid().v4();

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Home(userid)),
                  // );
                },
                child: Container(
                    width: 0.6 * width,
                    child: Container(child: Text('choose shopname'))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
