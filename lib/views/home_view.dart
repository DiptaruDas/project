//import 'package:brew_crew/models/Product.dart';
import 'package:brew_crew/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/widgets/provider_widget.dart';
import 'product_details.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: StreamBuilder(
//           stream: getUsersTripsStreamSnapshots(context),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) return const Text("Loading...");
//             return new ListView.builder(
//                 itemCount: snapshot.data.documents.length,
//                 itemBuilder: (BuildContext context, int index) =>
//                     buildTripCard(context, snapshot.data.documents[index]));
//           }),
//     );
//   }

//   Stream<QuerySnapshot> getUsersTripsStreamSnapshots(
//       BuildContext context) async* {
//     final uid = await Provider.of(context).auth.getCurrentUID();
//     yield* Firestore.instance
//         .collection('seller') //++++++++++++++++++++++++++++++++++++++++
//         .document(uid)
//         .collection('item')
//         .snapshots();
//   }

//   Widget buildTripCard(BuildContext context, DocumentSnapshot product) {
//     return new Container(
//       color: Colors.red[500],
//       child: new Bounce(
//         duration: Duration(seconds: 5),
//         onPressed: null,
//         child: Card(
//           child: GestureDetector(
//             onTap: () {
//               //Product item;
//               // item.name = product['name'];
//               // item.count = product['count'];
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ProductDetails(product['name'])),
//               );
//             },
//             child: Container(
//               color: Colors.orangeAccent[100],
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     Column(
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
//                           child: Row(children: <Widget>[
//                             Text(
//                               product['name'],
//                               style: new TextStyle(fontSize: 30.0),
//                             ),
//                             Spacer(),
//                           ]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
//                           child: Row(children: <Widget>[
//                             Text(
//                               product['count'],
//                               style: new TextStyle(fontSize: 30.0),
//                               // trip[
//                               //     'count'], /*"${DateFormat('dd/MM/yyyy').format(trip['startDate'].toDate()).toString()} - ${DateFormat('dd/MM/yyyy').format(trip['endDate'].toDate()).toString()}"*/
//                             ),
//                             Spacer(),
//                           ]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Text(
//                                 'Hi',
//                                 /*"\$${(trip['budget'] == null) ? "n/a" : trip['budget'].toStringAsFixed(2)}",*/
//                                 style: new TextStyle(fontSize: 35.0),
//                               ),
//                               Spacer(),
//                               //Icon(Icons.directions_car),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     Container(
//                       width: 2.5,
//                       height: 2.0,
//                       child: ClipRRect(
//                         borderRadius: new BorderRadius.circular(24.0),
//                         child: Image(
//                           fit: BoxFit.contain,
//                           alignment: Alignment.topRight,
//                           image: NetworkImage(product['url']),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//===========================================================================
// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: StreamBuilder(
//           stream: getUsersTripsStreamSnapshots(context),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) return const Text("Loading...");
//             return new ListView.builder(
//                 itemCount: snapshot.data.documents.length,
//                 itemBuilder: (BuildContext context, int index) =>
//                     buildTripCard(context, snapshot.data.documents[index]));
//           }),
//     );
//   }

//   Stream<QuerySnapshot> getUsersTripsStreamSnapshots(
//       BuildContext context) async* {
//     final uid = await Provider.of(context).auth.getCurrentUID();
//     yield* Firestore.instance
//         .collection('seller') //++++++++++++++++++++++++++++++++++++++++
//         .document(uid)
//         .collection('item')
//         .snapshots();
//   }

//   Widget buildTripCard(BuildContext context, DocumentSnapshot product) {
//     return new Container(
//       color: Colors.red[500],
//       child: new Bounce(
//         duration: Duration(seconds: 5),
//         onPressed: null,
//         child: Card(
//           child: GestureDetector(
//             onTap: () {
//               //Product item;
//               // item.name = product['name'];
//               // item.count = product['count'];
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ProductDetails(product['name'])),
//               );
//             },
//             child: Container(
//               color: Colors.orangeAccent[100],
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     Column(
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
//                           child: Row(children: <Widget>[
//                             Text(
//                               product['name'],
//                               style: new TextStyle(fontSize: 30.0),
//                             ),
//                             Spacer(),
//                           ]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
//                           child: Row(children: <Widget>[
//                             Text(
//                               product['count'],
//                               style: new TextStyle(fontSize: 30.0),
//                               // trip[
//                               //     'count'], /*"${DateFormat('dd/MM/yyyy').format(trip['startDate'].toDate()).toString()} - ${DateFormat('dd/MM/yyyy').format(trip['endDate'].toDate()).toString()}"*/
//                             ),
//                             Spacer(),
//                           ]),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Text(
//                                 'Hi',
//                                 /*"\$${(trip['budget'] == null) ? "n/a" : trip['budget'].toStringAsFixed(2)}",*/
//                                 style: new TextStyle(fontSize: 35.0),
//                               ),
//                               Spacer(),
//                               //Icon(Icons.directions_car),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     Container(
//                       width: 2.5,
//                       height: 2.0,
//                       child: ClipRRect(
//                         borderRadius: new BorderRadius.circular(24.0),
//                         child: Image(
//                           fit: BoxFit.contain,
//                           alignment: Alignment.topRight,
//                           image: NetworkImage(product['url']),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomeView extends StatelessWidget {
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
                    buildTripCard(context, snapshot.data.documents[index]));
          }),
    );
  }

  Stream<QuerySnapshot> getUsersTripsStreamSnapshots(
      BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance
        .collection('seller') //++++++++++++++++++++++++++++++++++++++++
        .document(uid)
        .collection('item')
        .snapshots();
  }

  Widget buildTripCard(BuildContext context, DocumentSnapshot product) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: new FittedBox(
              child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: myDetailsContainer1(product),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: NetworkImage(product['url']),
                            //"https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ));
    // Container(
    //   child: new FittedBox(
    //       child: Material(
    //           color: Colors.white,
    //           elevation: 14.0,
    //           borderRadius: BorderRadius.circular(24.0),
    //           shadowColor: Color(0x802196F3),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Container(
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 16.0),
    //                   child: myDetailsContainer1(product),
    //                 ),
    //               ),
    //               Container(
    //                 width: 250,
    //                 height: 200,
    //                 child: ClipRRect(
    //                   borderRadius: new BorderRadius.circular(24.0),
    //                   child: Image(
    //                     fit: BoxFit.contain,
    //                     alignment: Alignment.topRight,
    //                     image: NetworkImage(product['url']),
    //                     //"https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ))),
    // );
  }

  Widget myDetailsContainer1(DocumentSnapshot product) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            product['name'],
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                product['count'],
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              //Container(child: Text("(321) \u00B7 0.9 mi",
              // style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
            ],
          )),
        ),
        //Container(child: Text("Pastries \u00B7 Phoenix,AZ",
        // style: TextStyle(color: Colors.black54, fontSize: 18.0,fontWeight: FontWeight.bold),)),
      ],
    );
  }
}
