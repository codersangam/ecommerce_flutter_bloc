import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState()) {
    on<CartEvent>((event, emit) {});

    on<CartStartedEvent>((event, emit) async {
      emit(CartLoadingState());
      try {
        await Future.delayed(const Duration(seconds: 1));
        emit(const CartLoadedState());
      } catch (_) {
        emit(CartErrorState());
      }
    });

    on<CartProductAddEvent>((event, Emitter<CartState> emit) {
      final state = this.state;
      if (state is CartLoadedState) {
        try {
          emit(CartLoadedState(
              cart: Cart(
                  products: List.from(state.cart.products)
                    ..add(event.product))));
        } on Exception {
          emit(CartErrorState());
        }
      }
    });

    on<CartProductRemoveEvent>((event, Emitter<CartState> emit) {
      final state = this.state;
      if (state is CartLoadedState) {
        try {
          emit(CartLoadedState(
              cart: Cart(
                  products: List.from(state.cart.products)
                    ..remove(event.product))));
        } on Exception {
          emit(CartErrorState());
        }
      }
    });
  }
}
