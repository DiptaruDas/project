// class Trip {
//   String title;
//   DateTime startDate;
//   DateTime endDate;
//   double budget;
//   String travelType;

//   Trip(
//       this.title,
//       this.startDate,
//       this.endDate,
//       this.budget,
//       this.travelType
//       );

//   Map<String, dynamic> toJson() => {
//     'title': title,
//     'startDate': startDate,
//     'endDate': endDate,
//     'budget': budget,
//     'travelType': travelType,
//   };
// }
class Product {
  String name;
  String count;
  //String image;
  var url;
  String location;
  String productUserId;
  List<String> indexList;
  Product(this.name, this.count, this.location, this.productUserId,
      this.indexList, this.url);
  Map<String, dynamic> toJason() => {
        'name': name,
        'count': count,
        'url': url,
        'image': location,
        'productUserId': productUserId,
        'indexList': indexList,
      };
}
