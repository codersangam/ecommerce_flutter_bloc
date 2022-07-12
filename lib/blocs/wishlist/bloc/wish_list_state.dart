part of 'wish_list_bloc.dart';

abstract class WishListState extends Equatable {
  const WishListState();

  @override
  List<Object> get props => [];
}

class WishListLoadingState extends WishListState {}

class WishListLoadedState extends WishListState {
  final WishList wishList;
  const WishListLoadedState({this.wishList = const WishList()});

  @override
  List<Object> get props => [wishList];
}

class WishListErrorState extends WishListState {}
