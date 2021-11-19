import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:shop/chooseusername.dart';

import 'chooseshpname.dart';
import 'home_page_screen.dart';
import 'homepage.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

bool? status;

class _RegisterState extends State<Register> {
  var confirmpassword = new TextEditingController();
  var password = new TextEditingController();
  var courseofstudy = new TextEditingController();
  var email = new TextEditingController();
  var fullname = new TextEditingController();
  var turn = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Registration page"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: turn,
        child: ListView(
          children: [
    

            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
            ),

        


            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                  hintText: 'Enter password',
                ),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.all(15),
            //   child: TextField(
            //     obscureText: true,
            //     controller: confirmpassword,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'confirm password',
            //       hintText: 'Enter confirm password',
            //     ),
            //   ),
            // ),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
              ),
              child: Container(
                  width: 0.3 * width, child: Container(child: Text('rgister'))),
              onPressed: () async {

                // if (fullname.text.isEmpty ||
                //     email.text.isEmpty ||
                //     courseofstudy.text.isEmpty ||
                //     password.text.isEmpty ||
                //     confirmpassword.text.isEmpty) {
                //   final snackBar =
                //       SnackBar(content: Text('no field can be empty'));

                //   // Find the ScaffoldMessenger in the widget tree
                //   // and use it to show a SnackBar.
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

                //   return;
                // }

                if (EmailValidator.validate(email.text) == false) {
                  final snackBar = SnackBar(content: Text('invalid email'));

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  return;
                }

                // if (password.text.length < 8 ||
                //     confirmpassword.text.length < 8) {
                //   final snackBar = SnackBar(
                //       content: Text(
                //           "password or confirm password can't less than 8"));

                //   // Find the ScaffoldMessenger in the widget tree
                //   // and use it to show a SnackBar.
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

                //   return;
                // }

                // if (password.text != confirmpassword.text) {
                //   final snackBar = SnackBar(
                //       content: Text(
                //           "password and confirm password must be the same"));
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

                //   return;
                // }

                // if (status == null) {
                //   final snackBar = SnackBar(
                //       content: Text("you must either be male or female"));

                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

                //   return;
                // }

                try {
                  setState(() {
                    turn = true;
                  });
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email.text, password: password.text);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }

                  setState(() {
                    turn = false;
                  });
                  print(e);

                  final snackBar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                } catch (e) {
                  print(e);

                  setState(() {
                    turn = false;
                  });
                  final snackBar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  return;
                }
                String currentuser = FirebaseAuth.instance.currentUser!.uid;

                try {
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(currentuser)
                      .set({
                    "courseofstudy": courseofstudy.text,
                    "email": email.text,
                    "fullname": fullname.text,
                    "userid": currentuser,
                    "gender": status
                  });
                  setState(() {
                    turn = false;
                  });
                } catch (e) {
                  setState(() {
                    turn = false;
                  });

                  final snackBar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Choose()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
