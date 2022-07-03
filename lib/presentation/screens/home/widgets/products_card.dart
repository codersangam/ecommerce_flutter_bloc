part of 'widgets_imports.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                product.imageUrl.toString(),
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
              "${product.name}".text.bold.make(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$ ${product.price}".text.bold.make(),
                  IconButton(
                    onPressed: () {},
                    icon:
                        LineIcon(Icons.favorite_outline, color: Colors.orange),
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
        .wh(MediaQuery.of(context).size.width / 1.8, 250)
        .pSymmetric(h: 15);
  }
}
