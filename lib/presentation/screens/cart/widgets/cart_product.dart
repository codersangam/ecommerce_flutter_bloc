part of 'widgets_imports.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key, required this.product, required this.quantity})
      : super(key: key);

  final Product product;
  final int quantity;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  product.name.text.bold.xl.make(),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(
                                CartProductRemoveEvent(product),
                              );
                        },
                        icon: const Icon(LineIcons.trash),
                      );
                    },
                  ),
                ],
              ),
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
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return IconButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                        CartProductRemoveEvent(product),
                                      );
                                },
                                icon: const Icon(
                                  LineIcons.minus,
                                  size: 16,
                                ));
                          },
                        ),
                        "$quantity".text.make(),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return IconButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                        CartProductAddEvent(product),
                                      );
                                },
                                icon: const Icon(
                                  LineIcons.plus,
                                  size: 16,
                                ));
                          },
                        ),
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
