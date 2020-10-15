import 'package:flutter/material.dart';
import 'package:brew_crew/models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/widgets/provider_widget.dart';

class NewProductView extends StatelessWidget {
  final db = Firestore.instance;

  final Product product;
  NewProductView({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Add a new product'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (product.url != null)
                ? Image.network(product.url)
                : Placeholder(
                    fallbackHeight: 200.0, fallbackWidth: double.infinity),
            SizedBox(
              height: 20.0,
            ),
            Text("Finish"),
            Text("Product name ${product.name}"),
            Text("Number of products ${product.count}"),
            //Text("End Date ${trip.endDate}"),
            RaisedButton(
              child: Text("ADD"),
              onPressed: () async {
                // save data to fiebase
                final uid = await Provider.of(context).auth.getCurrentUID();
                await db
                    .collection("seller") //+++++++++++++++++++++
                    .document(uid)
                    .collection("item")
                    .add(product.toJason());
                await db.collection('product').add(product.toJason());
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        )));
  }
}
