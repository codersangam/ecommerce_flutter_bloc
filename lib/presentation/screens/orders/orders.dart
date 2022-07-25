part of 'orders_imports.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    LineIcons.checkCircle,
                    color: Colors.white,
                    size: 100,
                  ),
                  20.heightBox,
                  "Hi Sangam Singh".text.xl.white.bold.make(),
                  "Congratulations!".text.xl3.white.bold.make(),
                  "We have received your order.".text.xl3.white.bold.make(),
                  20.heightBox,
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context)
                          .popAndPush(const MainScreenRoute());
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      child: "Go Home".text.xl2.orange500.makeCentered(),
                    ).pSymmetric(h: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
