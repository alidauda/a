import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class OnOff extends StatefulWidget {
  OnOff({Key? key}) : super(key: key);

  @override
  _OnOffState createState() => _OnOffState();
}

User? userid = FirebaseAuth.instance.currentUser;

class _OnOffState extends State<OnOff> {
  var cod;
  var transfer;
  getuser() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userid?.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      // if (documentSnapshot.exists) {

      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;

      setState(() {
        cod = data["cod"];
        transfer = data["transfer"];
      });
      // } else {
      //   print('Document does not exist on the database');
      // }
    });
  }

  void initState() {
    super.initState();
    getuser();
  }

  void dispose() {
    super.dispose();
    getuser();
  }

  bool turn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      body: ModalProgressHUD(
        inAsyncCall: turn,
        child: ListView(
          children: [
            SwitchListTile.adaptive(
                activeColor: Colors.green,
                title: const Text(
                  "Cash on delivery",
                  style: TextStyle(fontSize: 20),
                ),
                value: cod == null ? false : cod,
                onChanged: (value) async {
                  setState(() {
                    turn = true;
                  });

                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userid?.uid)
                      .update({"cod": value});
                  setState(() {
                    cod = value;
                    turn = false;
                  });
                }),
            Divider(),
            SwitchListTile.adaptive(
                activeColor: Colors.green,
                title: const Text(
                  "Pay with transfer",
                  style: TextStyle(fontSize: 20),
                ),
                value: transfer == null ? false : transfer,
                onChanged: (value) async {
                   setState(() {
                    turn = true;
                  });

                  try{
 await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userid?.uid)
                      .update({"transfer": value});
                  setState(() {
                    transfer = value;
                    turn = false;
                  });
                  } catch (e) {
                    final snackBar = SnackBar(content: Text(e.toString()));

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState(() {
                    
                    turn = false;
                  });
                  }
                 
                  
                }),
            Divider()
          ],
        ),
      ),
    );
  }
}
