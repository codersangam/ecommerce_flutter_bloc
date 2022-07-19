part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<Category> category;

  const CategoryLoadedState({this.category = const <Category>[]});

  @override
  List<Object> get props => [category];
}
