import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String? name;
  final String? imageUrl;
  final Color? colorName;

  const Category({this.name, this.imageUrl, this.colorName});
  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
        name: "Soft Drinks",
        imageUrl: "assets/images/coca_cola.png",
        colorName: Colors.green),
    const Category(
        name: "Fast Food",
        imageUrl: "assets/images/pizza.png",
        colorName: Colors.red),
    const Category(
        name: "Dinner",
        imageUrl: "assets/images/dinner.png",
        colorName: Colors.blue),
    const Category(
        name: "Lunch",
        imageUrl: "assets/images/lunch.png",
        colorName: Colors.orange),
  ];
}
