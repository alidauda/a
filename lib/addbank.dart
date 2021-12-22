// @dart=2.9
import 'dart:convert';
import 'package:http/http.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'dart:async';

import 'homepage.dart';

User _userid = FirebaseAuth.instance.currentUser;

class Bankinfo extends StatefulWidget {
  static const routeName = "/addBank";

  @override
  _BankinfoState createState() => _BankinfoState();
}

class _BankinfoState extends State<Bankinfo> {
 Timer _debounce;


   // TextEditingController discountcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  // TextEditingController descontroller = new TextEditingController();
  TextEditingController numbercontroller = new TextEditingController();
@override
void dispose() {
    _debounce?.cancel();
    super.dispose();
}

  String mycode;
  List listofbanks = [
    'Access Bank Nigeria Plc',
    'Diamond Bank Plc',
    'Ecobank Nigeria',
    'Enterprise Bank Plc',
    'Fidelity Bank Plc',
    'First Bank of Nigeria Plc',
    'First City Monument Bank',
    'Guaranty Trust Bank Plc',
    'Heritaage Banking Company Ltd',
    'Jaiz Bank',
    'Keystone Bank Ltd',
    'Mainstreet Bank Plc',
    'Skye Bank Plc',
    'Stanbic IBTC Plc',
    'Sterling Bank Plc',
    'Union Bank Nigeria Plc',
    'United Bank for Africa Plc',
    'Unity Bank Plc',
    'WEMA Bank Plc',
    'Zenith Bank International'
  ];

  List listofbankscodes = [
   "044",
    "063",
    "050",
    "084",
    "070",
    "011",
    "214",
    "058",
    "030",
    "301",
    "082",
    "014",
    "076",
    "039",
    "232",
    "032",
    "033",
    "215",
    "035",
    "057"
  ];
final items=['Access Bank Nigeria Plc',
                            'Diamond Bank Plc',
                            'Ecobank Nigeria',
                            'Enterprise Bank Plc',
                            'Fidelity Bank Plc',
                            'First Bank of Nigeria Plc',
                            'First City Monument Bank',
                            'Guaranty Trust Bank Plc',
                            'Heritaage Banking Company Ltd',
                            'Jaiz Bank',
                            'Keystone Bank Ltd',
                            'Mainstreet Bank Plc',
                            'Skye Bank Plc',
                            'Stanbic IBTC Plc',
                            'Sterling Bank Plc',
                            'Union Bank Nigeria Plc',
                            'United Bank for Africa Plc',
                            'Unity Bank Plc',
                            'WEMA Bank Plc',
                            'Zenith Bank International'];
  var statusid = Uuid().v4();

  var _isloading = false;
String val;
String account_name;
  // final ImagePicker _picker = ImagePicker();

  // List listofimages = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,  
                    colors: [
                      Color(0x665ac18e),
                      Color(0x995ac18e),
                      Color(0xcc5ac18e),
                      Color(0xff5ac18e),
                    ],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ///Niche App Logo goes in here

                      Text(
                        'Please Fill in the Form',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Enter your Shopname',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            height: 60.0,
                            child: TextField(
                              controller:namecontroller,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.shop,
                                  color: Color(0xff5ac18e)
                                ),
                                hintText: 'Enter your Shopname',
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                          Container(
                          width:350,
                          padding: EdgeInsets.symmetric(horizontal:12, vertical:4),
                           decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("please select your bank name"),
                              value: val,
                              onChanged: (value){
                                 int index = listofbanks.indexOf(value);
                                 print(index);
                            if (index<0) {
                              return;
                            }
                                setState(() {
                                  val=value;
                                  mycode=listofbankscodes[index];
                                   print(mycode);
                                });
                                 print("pfffffffffffffffffffffffff");
                                 print(index);

                              },
                              items: items.map((value){
                               return DropdownMenuItem<String>(
value: value,
child:Text(value)
                               ); 

                              }).toList()
                                
                              ,
                            ),
                          ),
                        ),
                         SizedBox(
                        height: 30.0,
                      ), 
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Enter your Account Number',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            height: 60.0,
                            child: TextField(
                              controller:numbercontroller,  

                              onChanged: (value){

    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 3000), () async {
        // do something with query
        var query =numbercontroller.text;
        print("ssssssssssssssssssssssssssssssssssssssssss");
        print(query);
          final url = Uri.parse('https://api.paystack.co/bank/resolve?account_number=$query&bank_code=$mycode');
        final headers = {
      'Authorization':
          'Bearer sk_live_22f5e5e99b7acf6968cac206eefd17d548c7367a'
     
    };
    final response = await get(url, headers: headers, );
    Map res= jsonDecode(response.body);
    setState(() {
      account_name=res["data"]["account_name"];
      namecontroller.text=account_name.toString();
    });
        
    });

                              },
                              
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.account_balance,
                                  color: Color(0xff5ac18e)
                                ),
                                hintText: 'Enter your Account Number',
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                          
                          Text(
                           account_name==null?"":account_name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                         SizedBox(
                        height: 30.0,
                      ), 
                    
                            
                      
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () async{
                                                       
                            
                            setState(() {
                             _isloading = true;
                            });

//                 final snackBar = SnackBar(
//                                   content:
//                                       Text(mycode.toString()));

// // Find the ScaffoldMessenger in the widget tree
// // and use it to show a SnackBar.
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(snackBar);

//                               return;
                            if (mycode==null) {
                              final snackBar = SnackBar(
                                  content:
                                      Text('you must choose a valid bank'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              return;
                            }

                            if (namecontroller.text.isEmpty ||
                                // descontroller.text.isEmpty ||
                                numbercontroller.text.isEmpty) {
                              final snackBar = SnackBar(
                                  content: Text('no field can be empty'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              return;
                            }

                            // List oflinks = [];

                            // for (var item in listofimages) {
                            //   try {
                            //     UploadTask uploadTask = FirebaseStorage.instance
                            //         .ref()
                            //         .child("cloudpost_$statusid.jpg")
                            //         .putFile(File(item));
                            //     TaskSnapshot storageSnap =
                            //         await uploadTask.whenComplete(() => null);
                            //     String downloadUrl =
                            //         await storageSnap.ref.getDownloadURL();

                            //     setState(() {
                            //       statusid = Uuid().v4();
                            //       oflinks.add(downloadUrl);
                            //     });
                            //   } on FirebaseException catch (error) {
                            //     print(error);
                            //   }
                            // }
                          //  var subaa=await  makereq();
var params = convert.jsonEncode({
      "business_name": namecontroller.text,
      "bank_code": mycode,
      "account_number": numbercontroller.text,
      "percentage_charge": 0.0
      
    });

    final url = Uri.parse('https://api.paystack.co/subaccount');
    final headers = {
      'Authorization':
          'Bearer sk_live_22f5e5e99b7acf6968cac206eefd17d548c7367a',
      'Content-Type': 'application/json'
    };

    final response = await post(url, headers: headers, body: params);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    Map res= await jsonDecode(response.body);
       

                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(_userid.uid)
   
                                .update({
"account":true,
                          "subaccount_code":res["data"]["subaccount_code"]
                            });

                            
                            setState(() {
                              _isloading = false;
                            });
                            Navigator.of(context).pushReplacementNamed(MyStatefulWidget.routeName);
                            print('Pressed');

                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          child: Text(
                            'FINISH',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      
                      
                     
                    ],
                  ),
                ),
              )
            ],
          ),
    );
  }
}