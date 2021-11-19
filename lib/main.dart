// @dart=2.9

import 'package:my_ap/sss.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addp.dart';
import 'create_det.dart';
import 'home_page_screen.dart';
import 'homepage.dart';
import 'siginup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'addbank.dart';
import 'chooseshpname.dart';
import 'home.dart';
import 'register.dart';


// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home:LoginScreen(),
//       routes: {
//         CreateDetails.routeName:(_)=>CreateDetails(),
//         Create.routeName:(_)=>Create(),
//         // HomePageScreen.routeName:(_)=>HomePageScreen(),
//         // MyStatefulWidget.routeName:(_)=>MyStatefulWidget(),
      
//       },
//     );
//   }
// }
Future<void> main() async{
  var user=false;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences =await SharedPreferences.getInstance();
  var email =preferences.getString("number");
  runApp(  MaterialApp(
    debugShowCheckedModeBanner: false,
     
     
    routes:{
              CreateDetails.routeName:(_)=>CreateDetails(),
         Create.routeName:(_)=>Create(),
   // HomePageScreen.routeName:(_)=>HomePageScreen(),
         MyStatefulWidget.routeName:(_)=>MyStatefulWidget(),
    },
   
    home:  email==null?LoginScreen():MyStatefulWidget()

  ));
}

