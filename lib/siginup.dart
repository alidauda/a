
import 'package:cloud_firestore/cloud_firestore.dart';
import 'create_det.dart';

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;
import 'package:flutter_svg/flutter_svg.dart';

import 'homepage.dart';



User? use = FirebaseAuth.instance.currentUser;
CollectionReference users = FirebaseFirestore.instance.collection('users');

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
 

  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

     
SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString('number', phoneController.text);
          if(authCredential.user != null){
users.doc(use!.uid).get().then((doc) async => {
if(doc.exists){
   setState(() {
        showLoading = false;
      }),
  Navigator.of(context).pushReplacementNamed(CreateDetails.routeName)
}else{
 Navigator.push(context, MaterialPageRoute(builder: (context)=>  MyStatefulWidget()))
}
});
      
      }

    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
  }

  getMobileFormWidget(context) {
    
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Text("Please enter your phone number",textAlign: TextAlign.center,),
        Row(
          children: [
          
            Text("+234"),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone,
                              controller: phoneController,
                             // obscureText: true,
                              style: TextStyle(
                                //  color: Colors.white,
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                // border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.call,
                                  color: Color(0xFF6CA8F1),

                                ),
                                hintText: 'Enter your Phone number',
                                hintStyle: TextStyle(
                                  //color: Colors.white54,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
            ),
          ],
        ),
       SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 16,
            ),
        Container(
          width: double.infinity,
          
          child: FlatButton(
            padding: EdgeInsets.all(18),
            onPressed: () async {
              String pone;
              int num=phoneController.text.length;
if(num>11){
  pone=phoneController.text.substring(1);
}else{
  pone=phoneController.text;
}
              setState(() {
                showLoading = true;
              });

              await _auth.verifyPhoneNumber(
                phoneNumber: "+234"+pone,
                verificationCompleted: (phoneAuthCredential) async {
                  setState(() {
                    showLoading = false;
                  });
                  //signInWithPhoneAuthCredential(phoneAuthCredential);
                },
                verificationFailed: (verificationFailed) async {
                  setState(() {
                    showLoading = false;
                  });
                  _scaffoldKey.currentState!.showSnackBar(
                      SnackBar(content: Text(verificationFailed.code)));
                },
                codeSent: (verificationId, resendingToken) async {
                  setState(() {
                    showLoading = false;
                    currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                    this.verificationId = verificationId;
                  });
                },
                codeAutoRetrievalTimeout: (verificationId) async {},
              );
            },
            child: Text("SEND"),
            color: Colors.blue,
            textColor: Colors.white,
          ),
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        TextField(
                              controller: otpController,
                             // obscureText: true,
                              style: TextStyle(
                                //  color: Colors.white,
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                // border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                
                                hintText: 'Enter the code you just recive',
                                hintStyle: TextStyle(
                                  //color: Colors.white54,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
        
         SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 16,
            ),
        Container(
          width: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(10),
            onPressed: () async {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: otpController.text);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text("VERIFY"),
            color: Colors.blue,
            textColor: Colors.white,
          ),
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
        elevation: 3,
backgroundColor: Colors.white,

      ),
       resizeToAvoidBottomInset: true,
        key: _scaffoldKey,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
              
            child: Container(
              child: showLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                      ? getMobileFormWidget(context)
                      : getOtpFormWidget(context),
              padding: const EdgeInsets.all(16),
            ),
          ),
        ));
  }
}