import 'package:brew_crew/mainpage/SearchThroughImage.dart';
import 'package:brew_crew/mainpage/grid_view_products.dart';
import 'package:brew_crew/services/auth_service.dart';
import 'package:brew_crew/views/navigation_view.dart';
import 'package:brew_crew/widgets/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/mainpage/searchView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [
    // Center(
    //   child: Text('Home'),
    // ),
    ProductView(),
    //Search(),
    // Center(
    //   child: Text('Search'),
    // ),
    SearchPage(),
    // Center(
    //   child: Text('Camera'),
    // ),
    Camera(),
    // Center(
    //   child: Text('Upload file'),
    //),
    //Upload(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("SHOP PRODUCTS"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SellersHome()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print(e);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).pushNamed('/convertUser');
            },
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search', //"Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera,
              color: Colors.white,
            ),
            label: "Camera",
            backgroundColor: Colors.white,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.file_upload),
          //   label: "Upload",
          //   backgroundColor: Colors.blue,
          // ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 2) {}
          });
        },
      ),
      drawer: Drawer(),
    );
  }
}
