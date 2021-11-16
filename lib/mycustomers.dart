import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'customerorders.dart';

class Mycustomers extends StatefulWidget {
  var userid;
  Mycustomers(this.userid);

  @override
  _MycustomersState createState() => _MycustomersState(userid);
}

class _MycustomersState extends State<Mycustomers> {
  var userid;
  _MycustomersState(this.userid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green[400],title: Text('My customers'),),
      body: SafeArea(child: 
       StreamBuilder(
            stream: FirebaseFirestore.instance.collection("usercustomer").doc(userid).collection("mycustomers")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                
                children: [
             
             
                ...snapshot.data!.docs.map((document) {
       


                  String username = document['username'];
                  String customerid = document['customerid'];
                  
             

                  // String username = document['username'];
                  // String forumid = document['forumid'];
                  // String question = document['question'];
                  // String qid = document.id;
                  return ListTile(
                    title: Text(username),
                    trailing: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color: Colors.red)))),
                                      onPressed: () {
         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Customerorders(userid,customerid),
                ));
                                      },
                                      child: Center(
                                          child: Text(
                                        "see orders",
                                        style: TextStyle(color: Colors.orange),
                                      ))),
                  );
                }).toList(),
              ]);
            }),),
    );
  }
}