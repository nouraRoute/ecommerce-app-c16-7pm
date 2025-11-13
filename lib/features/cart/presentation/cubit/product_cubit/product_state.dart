part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class GetProductsLoadingState extends ProductState {}

final class GetProductsSuccessState extends ProductState {
  final List<ProductEntity> products;

  const GetProductsSuccessState({required this.products});
}

final class GetProductsFailureState extends ProductState {
  final Failure failure;

  const GetProductsFailureState({required this.failure});
}
