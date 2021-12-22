// @dart=2.9

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert' as convert;

import 'addbank.dart';
import 'homepage.dart';
// import 'home.dart';
User userid = FirebaseAuth.instance.currentUser;
class Choose extends StatefulWidget {
  

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
                  
  
  File image;
  bool turn = false;
 
  TextEditingController username = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: turn,
        child:Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x665ac18e),
                      Color(0x995ac18e),
                      Color(0xcc5ac18e),
                      Color(0xff5ac18e),
                    ],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ///Niche App Logo goes in here

                      Text(
                        'Create your Shop',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        Container(
              // backgroundImage: Image.file(file),
              // radius: 0.1 * height,
               
              child: image == null
                  ? InkWell(
                      onTap: () async {
                        XFile fi = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                            File croppedFile = await ImageCropper.cropImage(
        sourcePath: fi.path,
        aspectRatioPresets:Platform.isAndroid? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ]: [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop',
         toolbarColor: Color(0xffc69f50),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      setState(() {
        image = croppedFile;
      });
    }
                       
                      },
                      child: Container(
                        
                        decoration:BoxDecoration(
                          color: Colors.white,
 borderRadius: BorderRadius.circular(10.0)
                        ),
                        width:100,
                    height:100,
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : InkWell(
                    onTap: () async {
                       XFile fi = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                            File croppedFile = await ImageCropper.cropImage(
        sourcePath: fi.path,
        aspectRatioPresets:Platform.isAndroid? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ]: [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop',
         toolbarColor: Color(0xffc69f50),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      setState(() {
        image = croppedFile;
      });
    }
                    },
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      width:100,
                      height:100,
                        child: Image.file(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                  ),
            ),
                      SizedBox(height: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Enter your shopname',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            height: 60.0,
                            child: TextField(
                              controller: username ,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.shop,
                                  color: Color(0xff5ac18e)
                                ),
                                hintText: 'Enter your shopname',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      
                      
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () async{
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
var exist;
                  try{
await FirebaseFirestore.instance
    .collection("users")
    .where("shopname", isEqualTo: username.text)
    .get()
    .then((value) {
  value.docs.forEach((result) {
    print(result.data());
    exist=result.data()["shopname"];
  });
});
                  }catch(e){

                  }

       if (exist!=null) {
                    //  if (email.text.isEmpty||password.text.isEmpty) {
                    final snackBar =
                        SnackBar(content: Text('Taken! please choose another shopname'));

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    return;
                    // }

                  }
                  var statusid = Uuid().v4();

                  setState(() {
                    turn = true;
                  });
                 

                  try {
                    UploadTask uploadTask = FirebaseStorage.instance
                        .ref()
                        .child("cloudpost_$statusid.jpg")
                        .putFile(image);
                    TaskSnapshot storageSnap =
                        await uploadTask.whenComplete(() => null);
                    String downloadUrl = await storageSnap.ref.getDownloadURL();

                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(userid.uid)
                        .update({
                      "profile": downloadUrl,
                      "shopname": username.text.replaceAll(" ", "").toLowerCase(),
                      "cod":true,
                      "transfer":true
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

  // makereq();
                  setState(() {
                    turn = false;
                  });
                  Uuid().v4();
     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bankinfo()),
                );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Home(userid)),
                  // );
                
                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          child: Text(
                            'CHOOSE SHOPNAME',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              )
            ],
          ), 
      ),
    );
  }
}
