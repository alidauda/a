// @dart=2.9

import 'siginup.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'home_page_screen.dart';
import 'myorders.dart';
import 'package:firebase_auth/firebase_auth.dart';
var currentUser = FirebaseAuth.instance.currentUser.uid;


class MyStatefulWidget extends StatefulWidget {
 
  static const routeName="/navPage";
  // final userid;
    // MyStatefulWidget(this.userid );

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState( );
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
      




//   var userid;
// _MyStatefulWidgetState(this.userid);
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions;
@override
void initState() {
  super.initState();
  _widgetOptions = <Widget>[
    Home(currentUser) ,
    HomePageScreen(currentUser),
    Myorders(currentUser),
  
  ];
}
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.green[400],
        title:  Center(child: Text('Welcome')),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[400],
        items: const <BottomNavigationBarItem>[
        
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
             
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Products',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'orders',
            backgroundColor: Colors.green,
          ),
     
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
