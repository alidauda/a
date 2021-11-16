import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




import 'theme/light_color.dart';
import 'theme/text_styles.dart';
import '/theme/extention.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'theme/text_styles.dart';
import 'viewitem.dart';


  @override
class HomePageScreen extends StatefulWidget {
  var userid;
  static const routeName="/plistPage";
  HomePageScreen(this.userid);
 
  @override
  _HomePageState createState() => _HomePageState(userid);
}

class _HomePageState extends State<HomePageScreen> {
 
 
var _userid;

_HomePageState(this._userid);
 @override
  void initState() {
    super.initState();
    // a();
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hello ",
          style: TextStyles.title.subTitleColor,
        ),
       
      ],
    ).p16;
  }

  Widget _searchField() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: LightColor.grey.withOpacity(.3),
            blurRadius: 15,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyles.body.subTitleColor,
          suffixIcon: SizedBox(
            width: 50,
            child:
                Icon(Icons.search, color: LightColor.purple).alignCenter.ripple(
                      () {},
                      borderRadius: BorderRadius.circular(13),
                    ),
          ),
        ),
      ),
    );
  }

 
  
 


  Widget _doctorTile(DocumentSnapshot<Object?>model) {
    Map<String, dynamic> data=model.data()! as Map<String,dynamic>;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          onTap: (){
      },
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.network(
              
                
    data["images"][0],
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(data["name"].toString(), style: TextStyles.title.bold),
          subtitle: Text(
            data["price"].toString(),
            style: TextStyles.bodySm.subTitleColor.bold,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ).ripple(
        () {

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Viewitem(data)),);
          // Navigator.of(context).pushNamed( DetailScreen.routeName, arguments: {
          //   "id":data["doctorId"],
          //   "desc":data["about"],
          //   "spec":data["spec"],
          //   "img":data["docimage"],
          //   "name":data["name"]
          // });
        },
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
      
        //backgroundColor: Theme.of(context).backgroundColor,
        body:  
             
    
            StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("users").doc(_userid).collection("items").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
    
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
    // return Text( snapshot.data!.docs.toString());
              return 
                  CustomScrollView(
                    slivers: [
                      SliverList(delegate: SliverChildListDelegate([
                        
                      ]),),
                     SliverList(
            delegate: SliverChildListDelegate(
                  [
                    
                   Column(
                  children: snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
              //  return Text("description");
// return Text("hhh", style: TextStyles.title.bold);
            return _doctorTile(documentSnapshot);
      }).toList()),
                  ],
            ),
      )
                    ],
                  
                
              );
            }),
          
        
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.of(context).pushNamed(Create.routeName);
          },
          child: const Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),),
    );
      
  }
}
