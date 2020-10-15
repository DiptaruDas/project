import 'package:flutter/material.dart';
import 'package:brew_crew/pages.dart';
import 'package:brew_crew/views/home_view.dart';
import 'package:brew_crew/views/shop_app/location_view.dart';
import 'package:brew_crew/models/Product.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'searchOwnProduct.dart';
//import 'package:brew_crew/widgets/provider_widget.dart';
//import 'package:brew_crew/services/auth_service.dart';

class SellersHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SellersHomeState();
  }
}

class _SellersHomeState extends State<SellersHome> {
  // int _currentIndex = 0;
  // final List<Widget> _children = [
  //   HomeView(),
  //   ExplorePage(),
  //   PastTripsPage(),
  // ];

  @override
  Widget build(BuildContext context) {
    final newProduct = new Product(null, null, null, null, null, null);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Product list"),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => NewProductAddingView(
        //                   product: newProduct,
        //                 )),
        //       );
        //     },
        //   ),
        // IconButton(
        //   icon: Icon(Icons.undo),
        //   onPressed: () async {
        //     try {
        //       AuthService auth = Provider.of(context).auth;
        //       await auth.signOut();
        //       print("Signed Out!");
        //     } catch (e) {
        //       print(e);
        //     }
        //   },
        // ),
        // IconButton(
        //   icon: Icon(Icons.account_circle),
        //   onPressed: () {
        //     Navigator.of(context).pushNamed('/convertUser');
        //   },
        // )
        //],
      ),
      body: HomeView(), //_children[_currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //     onTap: onTabTapped,
      //     currentIndex: _currentIndex,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: new Icon(Icons.home),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: new Icon(Icons.explore),
      //         label: "Explore",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: new Icon(Icons.history),
      //         label: "Past Trips",
      //       ),
      //     ]),
      floatingActionButton: SpeedDial(
        // both default to 16
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        //visible: _dialVisible,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        //onOpen: () => print('OPENING DIAL'),
        //onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
              label: 'ADD',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewProductAddingView(
                                product: newProduct,
                              )),
                    )
                  }),
          SpeedDialChild(
            child: Icon(Icons.search),
            backgroundColor: Colors.blue,
            label: 'SEARCH',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchOwnProduct()),
              );
            },
          ),
          // SpeedDialChild(
          //   child: Icon(Icons.keyboard_voice),
          //   backgroundColor: Colors.green,
          //   label: 'Third',
          //   labelStyle: TextStyle(fontSize: 18.0),
          //   onTap: () => print('THIRD CHILD'),
          // ),
        ],
      ),
    );
  }

  // void onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
}
