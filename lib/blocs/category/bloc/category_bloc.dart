import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter_bloc/data/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoadingState()) {
    on<CategoryEvent>((event, emit) {});

    on<LoadCategoryEvent>((event, emit) {
      _categorySubscription?.cancel();
      _categorySubscription = _categoryRepository.getCategories().listen(
            (products) => add(
              UpdateCategoryEvent(products),
            ),
          );
    });

    on<UpdateCategoryEvent>((event, emit) {
      emit(
        CategoryLoadedState(category: event.category),
      );
    });
  }
}
