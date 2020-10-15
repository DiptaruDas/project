import 'dart:io';

import 'dart:math';

import 'package:brew_crew/views/shop_app/budget_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/models/Product.dart';
//import 'package:provider/provider.dart';
import 'package:brew_crew/widgets/provider_widget.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:permission_handler/permission_handler.dart';
//import 'date_view.dart';

class NewProductAddingView extends StatelessWidget {
  final Product product;
  NewProductAddingView({Key key, @required this.product}) : super(key: key);
  //String imageUrl;
  @override
  Widget build(BuildContext context) {
    //final uid = await Provider.of(context).auth.getCurrentUID();

    TextEditingController _nameController = new TextEditingController();
    _nameController.text = product.name;
    TextEditingController _countController = new TextEditingController();
    _countController.text = product.count;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Enter product details'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Enter name of the product"),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 30, left: 30),
              child: TextField(
                controller: _nameController,
                autofocus: true,
              ),
            ),
            Text("Enter number of these product"),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 30, left: 30),
              child: TextField(
                controller: _countController,
                autofocus: true,
              ),
            ),
            RaisedButton(
              child: Text('Upload Image'),
              color: Colors.lightBlue,
              onPressed: () async {
                final uid = await Provider.of(context).auth.getCurrentUID();
                getImage(uid);
              }, //=> uploadImage(),
            ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () async {
                final uid = await Provider.of(context).auth.getCurrentUID();
                product.name = _nameController.text;

                product.count = _countController.text;

                product.productUserId = uid;

                List<String> splitList = _nameController.text.split(' ');
                List<String> indexList = [];
                for (int i = 0; i < splitList.length; i++) {
                  for (int j = 0; j < splitList[i].length + i; j++) {
                    indexList.add(splitList[i].substring(0, j).toLowerCase());
                  }
                }

                product.indexList = indexList;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      // builder: (context) => NewTripDateView(trip: trip)
                      builder: (context) => NewProductView(product: product)),
                );
              },
            ),
          ],
        )));
  }

  // uploadImage() async {
  //   final _storage = FirebaseStorage.instance;
  //   final _picker = ImagePicker();
  //   PickedFile image;

  //   //Check Permissions
  //   await Permission.photos.request();

  //   var permissionStatus = await Permission.photos.status;

  //   if (permissionStatus.isGranted) {
  //     //Select Image
  //     image = await _picker.getImage(source: ImageSource.gallery);
  //     var file = File(image.path);

  //     if (image != null) {
  //       //Upload to Firebase
  //       var snapshot = await _storage
  //           .ref()
  //           .child('folderName/imageName')
  //           .putFile(file)
  //           .onComplete;

  //       var /*downloadUrl*/ imageUrl = await snapshot.ref.getDownloadURL();

  //       // setState(() {
  //       //   imageUrl = downloadUrl;
  //       // });
  //     } else {
  //       print('No Path Received');
  //     }
  //   } else {
  //     print('Grant Permissions and try again');
  //   }
  //   product.image = imageUrl;
  // }
  Future getImage(final uid) async {
    // Get image from gallery.
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _uploadImageToFirebase(image, uid);
  }

  Future<void> _uploadImageToFirebase(File image, final uid) async {
    try {
      // Make random image name.
      int randomNumber = Random().nextInt(1000000);
      String imageLocation = 'images/image$randomNumber.jpg';

      // Upload image to firebase.
      final StorageReference storageReference =
          FirebaseStorage().ref().child(imageLocation);
      final StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      _addPathToDatabase(imageLocation, uid);
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> _addPathToDatabase(String text, final uid) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage().ref().child(text);
      var imageString = await ref.getDownloadURL();
      //final uid = await Provider.of(context).auth.getCurrentUID();
      // Add location and url to database
      product.url = imageString;
      product.location = text;
      // await Firestore.instance
      //     .collection('seller')
      //     .document(uid)
      //     .collection('item')
      //     .document()
      //     .setData({'url': imageString, 'location': text});
    } catch (e) {
      print(e.message);
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         content: Text(e.message),
      //       );
      //     });
    }
  }
}
