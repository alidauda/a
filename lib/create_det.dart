import 'dart:math';

import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final User? auth = FirebaseAuth.instance.currentUser;

class CreateDetails extends StatefulWidget {
  static const routeName = "/createShopPage";
  @override
  _CreateDetailsState createState() => _CreateDetailsState();
}

class _CreateDetailsState extends State<CreateDetails> {
  var _isloading = false;

  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
        ),
        body: _isloading
            ? CircularProgressIndicator()
            : Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  children: [
                    TextField(
                      controller: _name,
                      // obscureText: true,
                      style: TextStyle(
                        //  color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),

                        hintText: 'Please enter your Shop Name',
                        hintStyle: TextStyle(
                          //color: Colors.white54,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          "Nigeria",
                          textAlign: TextAlign.start,
                        )),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () async {
                          setState(() {
                            _isloading = true;
                          });
                          try {
                            await FirebaseFirestore.instance
                                .collection("detailDoc")
                                .add({"name": _name.text, "userId": auth!.uid});
                                setState(() {
  _isloading=false;
});
Navigator.of(context).pushNamed(MyStatefulWidget.routeName);

                          } catch (e) {
                            setState(() {
  _isloading=false;
});
                            print(e);
                          }
                        },
                        child: Text("Create Shop"))
                  ],
                ),
              ),
      ),
    );
  }
}
