part of 'category_imports.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    int value = int.parse(category.colorName.toString());
    return Scaffold(
      appBar: VxAppBar(
        elevation: 0.0,
        searchBar: true,
        centerTitle: true,
        backgroundColor: Color(value).withOpacity(0.3),
        title: '${category.name}'.text.make(),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, index) {
            return ProductsCard(
              products: categoryProducts[index],
              widthFactor: 1.5,
            ).pSymmetric(h: 5);
          }),
    );
  }
}
