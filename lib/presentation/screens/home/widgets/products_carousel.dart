part of 'widgets_imports.dart';

class ProductsCarousel extends StatelessWidget {
  const ProductsCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductsCard(
            products: products[index],
          ).pOnly(right: 15);
        },
      ),
    );
  }
}
