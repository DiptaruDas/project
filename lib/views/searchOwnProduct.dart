import 'package:brew_crew/views/product_details.dart';
import 'package:brew_crew/widgets/provider_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class SearchOwnProduct extends StatefulWidget {
  @override
  _SearchOwnProductState createState() => _SearchOwnProductState();
}

class _SearchOwnProductState extends State<SearchOwnProduct> {
  TextEditingController searchController = TextEditingController();

  final database = Firestore.instance;
  String searchString;

  @override
  Widget build(BuildContext context) {
    //final uid = await Provider.of(context).auth.getCurrentUID();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          searchString = val.toLowerCase();
                        });
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: null,
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () => searchController.clear()),
                        hintText: 'Search Product',
                        hintStyle: TextStyle(
                            fontFamily: 'Antra', color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                  stream: (searchString == null || searchString.trim() == '')
                      ? Firestore.instance
                          .collection('seller')
                          // .document(uid)
                          // .collection('item')
                          .snapshots()
                      : Firestore.instance
                          .collection('product')
                          .where('indexList', arrayContains: searchString)
                          .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('we got an error ${snapshot.error}');
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return SizedBox(
                          child: Center(
                            child: LoadingFlipping.circle(),
                          ),
                        );
                      case ConnectionState.none:
                        return Text('Oops no data present');
                      case ConnectionState.done:
                        return Text('We are done');

                      // break;
                      default:
                        return new ListView(
                          children: snapshot.data.documents
                              .map((DocumentSnapshot product) {
                            return new Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0)),
                              elevation: 2.0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetails(product['name'])),
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
                            // ListTile(
                            //   title: Text(document['name']),

                            // );
                          }).toList(),
                        );
                    }
                  },
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
