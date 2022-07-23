import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../blocs/wishlist/bloc/wish_list_bloc.dart';
import '../home/widgets/widgets_imports.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange.withOpacity(0.3),
        title: "WishList".text.make(),
        centerTitle: true,
      ),
      body: BlocBuilder<WishListBloc, WishListState>(
        builder: (context, state) {
          if (state is WishListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          }
          if (state is WishListLoadedState) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.wishList.products.length,
                itemBuilder: (BuildContext context, index) {
                  return ProductsCard(
                    products: state.wishList.products[index],
                    widthFactor: 1.5,
                  ).pSymmetric(h: 5);
                });
          } else {
            return "Something went wrong".text.make();
          }
        },
      ),
    );
  }
}
