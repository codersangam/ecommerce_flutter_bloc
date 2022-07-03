part of 'home_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroCarouselCard(),
            "Popular Products".text.bold.xl2.make().pOnly(left: 15),
            ProductsCarousel(
                products: Product.products
                    .where((products) => products.isPopular)
                    .toList())
          ],
        ),
      ),
    );
  }
}
