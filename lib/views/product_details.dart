//import 'package:brew_crew/models/Product.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:brew_crew/models/Product.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/views/locationView.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  // final Product product;
  // ProductDetails({Key key, @required this.product}) : super(key: key);
  String name;
  ProductDetails(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text("Finish"),
          Text("Product name $name"),
          //Text("Number of products $count"),
          //Text("End Date ${trip.endDate}"),
          // RaisedButton(
          //   child: Text("ADD"),
          //   onPressed: () async {
          //     // save data to fiebase
          //     final uid = await Provider.of(context).auth.getCurrentUID();
          //     await db
          //         .collection("seller") //+++++++++++++++++++++
          //         .document(uid)
          //         .collection("item")
          //         .add(product.toJason());
          //     await db.collection('product').add(product.toJason());
          //     Navigator.of(context).popUntil((route) => route.isFirst);
          //   },
          // ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapView()),
          );
        },
        child: Icon(Icons.map),
      ),
    );
  }
}
