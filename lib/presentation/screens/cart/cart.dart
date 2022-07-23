part of 'cart_imports.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          }
          if (state is CartLoadedState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.red]),
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
                        "${state.cart.products.length} Items"
                            .text
                            .xl2
                            .white
                            .make(),
                      ],
                    ).pSymmetric(h: 15),
                  ),
                  20.heightBox,
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.cart
                          .productQuantity(state.cart.products)
                          .keys
                          .length,
                      itemBuilder: (context, index) {
                        return CartProduct(
                          product: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .elementAt(index),
                          quantity: state.cart
                              .productQuantity(state.cart.products)
                              .values
                              .elementAt(index),
                        );
                      }),
                  Divider(
                    thickness: 3,
                    color: Colors.grey[200],
                  ).pSymmetric(h: 15),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Sub Total"
                          .text
                          .color(Colors.black.withOpacity(0.46))
                          .make(),
                      "\$ ${state.cart.subTotalString}"
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
                      "\$ ${state.cart.subTotalString}"
                          .text
                          .xl2
                          .color(Colors.orange)
                          .bold
                          .make(),
                    ],
                  ).pSymmetric(h: 15),
                  20.heightBox,
                  GradientButton(
                    onTap: () => AutoRouter.of(context)
                        .push(const CheckoutScreenRoute()),
                    title: "Checkout",
                  )
                ],
              ).pOnly(bottom: 100),
            );
          } else {
            return "Something went wrong".text.make();
          }
        },
      ),
    );
  }
}
