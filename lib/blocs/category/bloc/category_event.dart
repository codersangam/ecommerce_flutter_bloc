part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoryEvent extends CategoryEvent {}

class UpdateCategoryEvent extends CategoryEvent {
  final List<Category> category;

  const UpdateCategoryEvent(this.category);

  @override
  List<Object> get props => [category];
}
