// @dart=2.9

import 'package:firebase_auth/firebase_auth.dart';

import 'settings.dart';
import 'siginup.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'home_page_screen.dart';
import 'myorders.dart';
User userid = FirebaseAuth.instance.currentUser;
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
    Home() ,
    HomePageScreen(),
    Myorders(),
   Settings()
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
     
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[400],
        showUnselectedLabels:true,
        items: const <BottomNavigationBarItem>[
        
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            
             backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Products',
            backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_rounded ),
            label: 'orders',
            backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
          
            icon: Icon(Icons.settings ),
            label: 'settings',
            backgroundColor: Colors.green
          ),
     
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        onTap: _onItemTapped,
        unselectedItemColor:Colors.white ,
      ),
    );
  }
}
