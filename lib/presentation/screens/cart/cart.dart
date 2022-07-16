part of 'cart_imports.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: width,
              decoration: BoxDecoration(
                gradient:
                    const LinearGradient(colors: [Colors.orange, Colors.red]),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Cart".text.xl3.white.make(),
                  "2 Items".text.xl2.white.make(),
                ],
              ).pSymmetric(h: 15),
            ),
            20.heightBox,
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                // scrollDirection: Axis.vertical,
                itemCount: Cart().product.length,
                itemBuilder: (context, index) {
                  return CartProduct(product: Cart().product[index]);
                }),
            Divider(
              thickness: 3,
              color: Colors.grey[200],
            ).pSymmetric(h: 15),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Sub Total".text.color(Colors.black.withOpacity(0.46)).make(),
                "\$ ${Cart().subTotalString}"
                    .text
                    .color(Colors.black.withOpacity(0.46))
                    .make(),
              ],
            ).pSymmetric(h: 15),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Total".text.xl2.bold.make(),
                "\$ ${Cart().subTotalString}"
                    .text
                    .xl2
                    .color(Colors.orange)
                    .bold
                    .make(),
              ],
            ).pSymmetric(h: 15),
            20.heightBox,
            Container(
              height: 50,
              width: width,
              decoration: BoxDecoration(
                gradient:
                    const LinearGradient(colors: [Colors.orange, Colors.red]),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: "Checkout".text.xl2.white.makeCentered(),
            ).pSymmetric(h: 15),
          ],
        ).pOnly(bottom: 100),
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              product.name.text.bold.xl.make(),
              5.heightBox,
              product.category.text
                  .color(Colors.black.withOpacity(0.46))
                  .make(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F5F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              LineIcons.minus,
                              size: 16,
                            )),
                        "1".text.make(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              LineIcons.plus,
                              size: 16,
                            )),
                      ],
                    ),
                  ),
                  10.widthBox,
                  "\$ ${product.price}"
                      .text
                      .bold
                      .color(Colors.orange)
                      .xl
                      .make(),
                ],
              ),
            ],
          ),
        ],
      ).pSymmetric(h: 10),
    ).pSymmetric(h: 15);
  }
}
