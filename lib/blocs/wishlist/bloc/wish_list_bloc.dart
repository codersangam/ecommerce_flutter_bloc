import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/wish_list_model.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListLoadingState()) {
    on<WishListEvent>((event, emit) {});

    on<StartWishListEvent>((event, emit) async {
      emit(WishListLoadingState());
      try {
        await Future.delayed(const Duration(seconds: 1));
        emit(const WishListLoadedState());
      } catch (_) {}
    });

    on<AddWishListProductEvent>((event, Emitter<WishListState> emit) {
      final state = this.state;
      if (state is WishListLoadedState) {
        try {
          emit(WishListLoadedState(
              wishList: WishList(
                  products: List.from(state.wishList.products)
                    ..add(event.product))));
        } catch (_) {}
      }
    });

    on<RemoveWishListProductEvent>((event, Emitter<WishListState> emit) {
      final state = this.state;
      if (state is WishListLoadedState) {
        try {
          emit(WishListLoadedState(
              wishList: WishList(
                  products: List.from(state.wishList.products)
                    ..remove(event.product))));
        } catch (_) {}
      }
    });
  }
}
