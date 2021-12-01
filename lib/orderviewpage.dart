import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'theme/light_color.dart';

class Orderview extends StatefulWidget {
  var image, name, alt, phoneNumber, orderId, status, price, quantity, address;
  Orderview(this.image, this.name, this.alt, this.phoneNumber, this.orderId,
      this.status, this.price, this.quantity, this.address);

  @override
  _OrderviewState createState() => _OrderviewState();
}

class _OrderviewState extends State<Orderview> {
  // var post;
// _OrderviewState(this.post);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Center(child: Text("order")),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 0.99 * width,
                height: 0.85 * height,
                child: Container(
                  // height: 0.5*height,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            child: Container(
                              height: 0.3 * height,
                              width: 0.45 * width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // color: Colors.green,
                              ),
                              child: widget.image == null
                                  ? Icon(Icons.category_sharp)
                                  : Image.network(
                                      widget.image,
                                      height: 0.3 * height,
                                      width: 0.5 * width,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      //                      Container(
                      //   height: 0.3*height,
                      //   width: 0.9*width,
                      //   child: ListView(
                      //     children: [
                      //                    for(var item in data['images'] ) Padding(
                      //                      padding: const EdgeInsets.all(8.0),
                      //                      child: CachedNetworkImage(imageUrl: item),
                      //                    )

                      //     ],
                      //   ),

                      // ),
                      ListTile(
                        title: Text(
                            widget.name.toString() + " ordered " + widget.alt),
                        // subtitle:
                        //     Text('at' + post[index]['createdAt']),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(color: Colors.green),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "phone number: " + widget.phoneNumber.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("order Id: " + widget.orderId.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text("order status: " + widget.status.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("price paid: " + widget.price.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Quantity: " + widget.quantity.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("address: " + widget.address.toString()),
                      ),
                      Container(
                        width: width,
                        child: Center(
                          child: Container(
                            width: 0.4 * width,
                            height: 0.1 * height,
                            child: Center(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.green)))),
                                  onPressed: () async {
                                    try {
                                          final Uri launchUri = Uri(
                                      scheme: 'tel',
                                      path: widget.phoneNumber,
                                    );
                                        await launch(launchUri.toString());

                                    } catch (e) {
                                    }
                                
                                    // Share.share(
                                    //     'check out my website https://www.shopity.me/');

                                    //                              Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => Orderview(widget.post)),
                                    // );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        "Call",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //         Container(
              //   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.all(Radius.circular(20)),
              //     boxShadow: <BoxShadow>[
              //       BoxShadow(
              //         offset: Offset(4, 4),
              //         blurRadius: 10,
              //         color: LightColor.grey.withOpacity(.2),
              //       ),
              //       BoxShadow(
              //         offset: Offset(-3, 0),
              //         blurRadius: 15,
              //         color: LightColor.grey.withOpacity(.1),
              //       )
              //     ],
              //   ),
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              //     child:  Padding(
              //           padding: const EdgeInsets.only(left: 40,right: 40),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //              Container(
              //                                        width: 0.2*width,
              //                                       child: ElevatedButton(

              //                                           style: ButtonStyle(
              //                                                   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),

              //                                               shape: MaterialStateProperty.all<
              //                                                       RoundedRectangleBorder>(
              //                                                   RoundedRectangleBorder(
              //                                                       borderRadius:
              //                                                           BorderRadius.circular(
              //                                                               18.0),
              //                                                       side: BorderSide(
              //                                                           color: Colors.red)))),
              //                                           onPressed: () {},
              //                                           child: Text(
              //                                             "reject",
              //                                             // style: TextStyle(color: Colors.green),
              //                                           )),
              //                                     ), Container(
              //                                        width: 0.2*width,
              //                                       child: ElevatedButton(

              //                                           style: ButtonStyle(
              //                                                   backgroundColor: MaterialStateProperty.all<Color>(Colors.green),

              //                                               shape: MaterialStateProperty.all<
              //                                                       RoundedRectangleBorder>(
              //                                                   RoundedRectangleBorder(
              //                                                       borderRadius:
              //                                                           BorderRadius.circular(
              //                                                               18.0),
              //                                                       side: BorderSide(
              //                                                           color: Colors.green)))),
              //                                           onPressed: () {},
              //                                           child: Text(
              //                                             "accept",
              //                                             // style: TextStyle(color: Colors.green),
              //                                           )),
              //                                     ),
              //           ],),
              //         ),

              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
