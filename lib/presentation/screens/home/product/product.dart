part of 'product_imports.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.products}) : super(key: key);

  final Product products;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.orange, Colors.red])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.products.imageUrl,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          AutoRouter.of(context).pop();
                        },
                        icon: LineIcon(
                          Icons.arrow_back,
                          color: Colors.orange,
                        ).centered(),
                      ).glassMorphic(),
                      IconButton(
                        onPressed: () {},
                        icon: LineIcon(
                          Icons.favorite,
                          color: Colors.orange,
                        ),
                      ).glassMorphic(
                        opacity: 0.01,
                      ),
                    ],
                  ).p8(),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.4,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.products.name.text.bold.xl3.make(),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VxRating(
                                    onRatingUpdate: (value) {},
                                    count: 1,
                                  ),
                                  2.widthBox,
                                  "4.3".text.make(),
                                ],
                              ).pSymmetric(h: 10, v: 10),
                            ),
                            10.widthBox,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/delivery.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                  2.widthBox,
                                  "20 Mins".text.make(),
                                ],
                              ).pSymmetric(h: 10, v: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                    10.heightBox,
                    "Description".text.bold.xl2.make(),
                    widget.products.details.text.maxLines(7).make(),
                  ],
                ).pOnly(left: 15, right: 15, top: 15, bottom: 80),
              ),
              10.heightBox,
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "2 Items".text.white.make(),
                      "Rs ${widget.products.price}".text.white.xl2.make(),
                      VxCircle(
                        radius: 50,
                        backgroundColor: Colors.black,
                        child: LineIcon(
                          Icons.store,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ).pSymmetric(h: 15)
            ],
          ),
        ),
      ),
    );
  }
}
