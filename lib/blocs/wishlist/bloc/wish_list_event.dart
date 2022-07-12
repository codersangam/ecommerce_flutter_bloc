part of 'wish_list_bloc.dart';

abstract class WishListEvent extends Equatable {
  const WishListEvent();

  @override
  List<Object> get props => [];
}

class StartWishListEvent extends WishListEvent {}

class AddWishListProductEvent extends WishListEvent {
  final Product product;
  const AddWishListProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveWishListProductEvent extends WishListEvent {
  final Product product;
  const RemoveWishListProductEvent(this.product);

  @override
  List<Object> get props => [product];
}
