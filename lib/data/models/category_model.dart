import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String? name;
  final String? imageUrl;

  const Category({this.name, this.imageUrl});
  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
        name: "Soft Drinks", imageUrl: "assets/images/coca_cola.png"),
    const Category(name: "Fast Food", imageUrl: "assets/images/pizza.png"),
    const Category(name: "Dinner", imageUrl: "assets/images/dinner.png"),
    const Category(name: "Lunch", imageUrl: "assets/images/lunch.png"),
  ];
}
