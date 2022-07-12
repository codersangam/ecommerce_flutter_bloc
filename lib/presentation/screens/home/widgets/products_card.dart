part of 'widgets_imports.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({Key? key, required this.products, this.widthFactor = 1.8})
      : super(key: key);

  final Product products;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          AutoRouter.of(context).push(ProductScreenRoute(products: products)),
      child: VxBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  products.imageUrl.toString(),
                  fit: BoxFit.cover,
                  height: 175,
                  width: MediaQuery.of(context).size.width,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: LineIcon(
                      Icons.add,
                      color: Colors.orange,
                    ),
                  ).glassMorphic(),
                ).p8(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.heightBox,
                products.name.text.bold.make(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '\$ ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.orange),
                        children: [
                          TextSpan(
                              text: products.price,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: LineIcon(Icons.favorite_outline,
                          color: Colors.orange),
                    ),
                  ],
                )
              ],
            ).pSymmetric(h: 15),
          ],
        ),
      )
          .make()
          .cornerRadius(10)
          .backgroundColor(Colors.white)
          .wh(MediaQuery.of(context).size.width / widthFactor, 250),
    );
  }
}
