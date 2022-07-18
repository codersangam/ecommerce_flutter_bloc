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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Hello Sangam 👋".text.bold.size(24).make(),
                  Image.asset(
                    "assets/icons/search.png",
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
              "It's lunch time!".text.make(),
              20.heightBox,
              VxBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      LineIcons.mapMarker,
                      color: Colors.orange,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Your Delivery Address"
                            .text
                            .color(Colors.black.withOpacity(0.46))
                            .make(),
                        "#27, Opp. KNS College, Bangalore, India"
                            .text
                            .bold
                            .make()
                      ],
                    ),
                    const Icon(
                      LineIcons.angleRight,
                      color: Colors.orange,
                    )
                  ],
                ).pSymmetric(h: 10),
              )
                  .make()
                  .cornerRadius(20)
                  .backgroundColor(const Color(0xffF2F6FC))
                  .glassMorphic(
                    borderRadius: BorderRadius.circular(20),
                  )
                  .h(100),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Category".text.bold.xl2.make(),
                  "See All".text.bold.orange500.make(),
                ],
              ),
              5.heightBox,
              CategoryCarousel(
                categories: Category.categories.map((e) => e).toList(),
                // color: Colors.blue,
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Most Popular".text.bold.xl2.make(),
                  "See All".text.bold.orange500.make(),
                ],
              ),
              5.heightBox,
              ProductsCarousel(
                products: Product.products
                    .where((products) => products.isPopular)
                    .toList(),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Recommended".text.bold.xl2.make(),
                  "See All".text.bold.orange500.make(),
                ],
              ),
              5.heightBox,
              ProductsCarousel(
                products: Product.products
                    .where((products) => products.isRecommended)
                    .toList(),
              ),
            ],
          ).pSymmetric(h: 15),
        ),
      ),
    );
  }
}
