import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final String price;
  final bool isPopular;
  final bool isRecommended;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isPopular,
      required this.isRecommended});

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];

  static List<Product> products = [
    const Product(
      name: "Pepsi",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1629203851122-3726ecdf080e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=929&q=80",
      price: "299",
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: "Momo",
      category: "Fast Food",
      imageUrl:
          "https://images.unsplash.com/photo-1626776876729-bab4369a5a5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80",
      price: "500",
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      name: "Fish Curry",
      category: "Dinner",
      imageUrl:
          "https://images.unsplash.com/photo-1626508035297-0cd27c397d67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      price: "199",
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      name: "Rice",
      category: "Lunch",
      imageUrl:
          "https://images.unsplash.com/photo-1603133872878-684f208fb84b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
      price: "765",
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      name: "Noodles",
      category: "Fast Food",
      imageUrl:
          "https://images.unsplash.com/photo-1634864572865-1cf8ff8bd23d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1034&q=80",
      price: "145",
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      name: "Coke",
      category: "Soft Drinks",
      imageUrl:
          "https://images.unsplash.com/photo-1581098365948-6a5a912b7a49?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      price: "60",
      isPopular: true,
      isRecommended: false,
    ),
  ];
}
