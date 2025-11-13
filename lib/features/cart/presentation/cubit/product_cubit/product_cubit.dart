import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/network/error_handling.dart';
import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/cart/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/cart/domain/usecases/get_products_by_subcategory_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final String subcategoryId;
  ProductCubit(
      this._getProductsBySubcategoryUsecase, @factoryParam this.subcategoryId)
      : super(ProductInitial()) {
    getProducts();
  }
  final GetProductsBySubcategoryUsecase _getProductsBySubcategoryUsecase;
  getProducts() async {
    emit(GetProductsLoadingState());

    Response<List<ProductEntity>> response =
        await _getProductsBySubcategoryUsecase(subcategoryId);
    switch (response) {
      case Success<List<ProductEntity>>():
        emit(GetProductsSuccessState(products: response.data));
      case FailureResponse<List<ProductEntity>>():
        emit(GetProductsFailureState(failure: response.failure));
    }
  }
}
