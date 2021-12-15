import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'edit.dart';

class Viewitem extends StatefulWidget {
  Map data;
  var id;
  Viewitem(this.data, this.id);

  @override
  _ViewitemState createState() => _ViewitemState(data);
}

class _ViewitemState extends State<Viewitem> {
  Map data;
  _ViewitemState(this.data);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(data['name'].toString().toUpperCase(),
              style: TextStyle(
                  // color: Colors.green
                  )),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 0.5 * height,
                width: 0.99 * width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var item in data['images'])
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl: item,
                              fit: BoxFit.fill,
                            )),
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data['name'].toString().toUpperCase(),
                  style: TextStyle(fontSize: 0.07 * height, color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Text(
                  'description:',
                  style: TextStyle(fontSize: 0.03 * height, color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text(
                  data['description'].toString(),
                  style: TextStyle(fontSize: 0.03 * height, color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'price: ' + '₦' + data['price'].toString(),
                  style: TextStyle(fontSize: 0.03 * height, color: Colors.green),
                ),
              ),
              Container(
                width: width,
                child: Center(
                  child: Container(
                    width: 0.3 * width,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.green)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Editproduct(
                                    data['name'].toString().toUpperCase(),
                                    data['description'].toString(),
                                    data['price'].toString(),
                                    data['quantity'].toString(),
                                    widget.id)),
                          );
                        },
                        child: Text(
                          "edit product",
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:convert' as convert;

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';


// void main(List<String> arguments) async {
//   // This example uses the Google Books API to search for books about http.
//   // https://developers.google.com/books/docs/overview
//   var url =
//       Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.post(url);
//   if (response.statusCode == 200) {
//     var jsonResponse =
//         convert.jsonDecode(response.body) as Map<String, dynamic>;
//     var itemCount = jsonResponse['totalItems'];
//     print('Number of books about http: $itemCount.');
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }


// makereq() async {
// var params=convert.jsonEncode({
//   "email": "alidauda14@gmail.com",
//   "amount": "20000",
//   "subaccount": "ACCT_q7qaqe5hqxhgn7s",
  
// });

//     final url = Uri.parse('api.paystack.co');
//     final headers = {    'Authorization': 'Bearer sk_test_0a85cdf8c1a04bc817c696ca12fe20c9088f5415',
//     'Content-Type': 'application/json'};

//         final response = await post(url, headers: headers, body: params);
// print('Status code: ${response.statusCode}');
//     print('Body: ${response.body}');

//   }


// }

//   const https = require('https')
// const params = JSON.stringify(
// {
//   "email": "alidauda14@gmail.com",
//   "amount": "20000",
//   "subaccount": "ACCT_q7qaqe5hqxhgn7s",
  
// }
// )

// const options = {
//   hostname: 'api.paystack.co',
//   port: 443,
//   path: '/transaction/initialize',
//   method: 'POST',
//   headers: {
//     Authorization: 'Bearer sk_test_0a85cdf8c1a04bc817c696ca12fe20c9088f5415',
//     'Content-Type': 'application/json'
//   }
// }
// const req = https.request(options, res => {
//   let data = ''
//   res.on('data', (chunk) => {
//     data += chunk
//   });
//   res.on('end', () => {
//     const output=JSON.parse(data)
//     window.location=output.data.authorization_url
    
//   })
// }).on('error', error => {
//   console.error(error)
// })
// req.write(params)
// req.end()
// }