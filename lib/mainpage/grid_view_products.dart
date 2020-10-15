import 'package:brew_crew/views/product_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:brew_crew/widgets/provider_widget.dart';
//import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getUsersTripsStreamSnapshots(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Loading...");
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    gridViewProduct(context, snapshot.data.documents[index]));
          }),
    );
  }

  Stream<QuerySnapshot> getUsersTripsStreamSnapshots(
      BuildContext context) async* {
    // final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance
        // .collection('seller') //++++++++++++++++++++++++++++++++++++++++
        // .document(uid)
        .collection('product')
        .snapshots();
  }

  Widget gridViewProduct(BuildContext context, DocumentSnapshot product) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      elevation: 2.0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(product['name'])),
          );
        },
        child: Container(
            height: 100,
            width: 50,
            color: Colors.red[400],
            child: Column(
              children: [
                Center(
                  child: Text(
                    product['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    product['count'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
