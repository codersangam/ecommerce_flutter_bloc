import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String? name;
  final String? imageUrl;
  final String? colorName;

  const Category({this.name, this.imageUrl, this.colorName});
  @override
  List<Object?> get props => [name, imageUrl];

  // static List<Category> categories = [
  //   const Category(
  //       name: "Soft Drinks",
  //       imageUrl: "assets/images/coca_cola.png",
  //       colorName: Colors.green),
  //   const Category(
  //       name: "Fast Food",
  //       imageUrl: "assets/images/pizza.png",
  //       colorName: Colors.red),
  //   const Category(
  //       name: "Dinner",
  //       imageUrl: "assets/images/dinner.png",
  //       colorName: Colors.blue),
  //   const Category(
  //       name: "Lunch",
  //       imageUrl: "assets/images/lunch.png",
  //       colorName: Colors.orange),
  // ];

  static Category fromSnapshot(DocumentSnapshot snapshot) {
    Category category = Category(
        name: snapshot['name'],
        // name: snapshot.get('name'),
        imageUrl: snapshot['imageUrl'],
        colorName: snapshot['colorName']);
    return category;
  }
}
