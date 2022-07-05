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
                  LineIcon.search(),
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
                        "Your Delivery Address".text.gray300.make(),
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
                color: Colors.blue,
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

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel(
      {Key? key, required this.categories, required this.color})
      : super(key: key);
  final List<Category> categories;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            categories: categories[index],
            color: color,
          ).pOnly(right: 15);
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categories, required this.color})
      : super(key: key);

  final Category categories;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Stack(
        children: [
          categories.name!.text.bold.make().pOnly(top: 10, left: 15),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              categories.imageUrl.toString(),
            ),
          ),
        ],
      ),
    )
        .make()
        .backgroundColor(color.withOpacity(0.1))
        .cornerRadius(20)
        .wh(170, 100);
  }
}
