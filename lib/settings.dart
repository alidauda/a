import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'off.dart';
import 'siginup.dart';
import 'updateShopname.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _stat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Settings"),centerTitle: true,),
      body: ModalProgressHUD(

        inAsyncCall: _stat,
        child: ListView(
          children: [
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => Choosee())),
              child: Container(
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(1),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(Icons.store),
                      title: Text("Edit store details"),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => OnOff())),
              child: Container(
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(1),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(Icons.payment),
                      title: Text("Payment Method"),
                    ),
                  ),
                ),
              ),
            ),
             InkWell(
              onTap: ()async{ 
                setState(() {
                  _stat=true;
                });
          SharedPreferences preferences=await SharedPreferences.getInstance();
          preferences.remove("number");
      await FirebaseAuth.instance.signOut().then((value) => {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen())),
      setState(() {
                  _stat=false;
                })
      });
              },
              child: Container(
               
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(1),
                child: Card(
                   color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(Icons.settings_applications),
                      title: Text("Sign out"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
