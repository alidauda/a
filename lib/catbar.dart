import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Catbar extends StatefulWidget {
  var userid;
  Catbar(this.userid);

  @override
  _CatbarState createState() => _CatbarState(userid);
}

class _CatbarState extends State<Catbar> {
  var userid;
  _CatbarState(this.userid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
       StreamBuilder(
            stream: FirebaseFirestore.instance.collection("usercategories").doc(userid).collection("mycategories")
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
                ElevatedButton(
                    style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.red)
    )
  )
),
                    onPressed: () {
               
                    },
                    child: Center(
                                      child: Text(
                                    "all",
                                    style: TextStyle(color: Colors.orange),
                                  ))
                  ),
             
                ...snapshot.data!.docs.map((document) {
       


                  String category = document['category'];
             

                  // String username = document['username'];
                  // String forumid = document['forumid'];
                  // String question = document['question'];
                  // String qid = document.id;
                  return ElevatedButton(
                    style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.red)
    )
  )
),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => Questionview(
                      //           userid,
                      //           forumid,
                      //           {
                      //             "fullname": fullname,
                      //             "username": username,
                      //             "question": question,
                      //             "profile": profile
                      //           },
                      //           qid,
                      //           qid,
                      //           role)),
                      // );
                    },
                    child: Center(
                                      child: Text(
                                    "category",
                                    style: TextStyle(color: Colors.orange),
                                  ))
                  );
                }).toList(),
              ]);
            }),),
    );
  }
}