import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter_bloc/data/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoadingState()) {
    on<ProductEvent>((event, emit) {});

    on<LoadProductEvent>((event, emit) {
      _productSubscription?.cancel();
      _productSubscription = _productRepository.getProducts().listen(
            (products) => add(
              UpdateProductEvent(products),
            ),
          );
    });

    on<UpdateProductEvent>((event, emit) {
      emit(
        ProductLoadedState(product: event.product),
      );
    });
  }
}
