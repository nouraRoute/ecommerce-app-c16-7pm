import 'package:ecommerce_app/core/network/error_handling.dart';
import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:ecommerce_app/features/cart/data/models/products_list_reponse/products_list_response.dart';
import 'package:ecommerce_app/features/cart/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasource _cartRemoteDatasource;

  CartRepositoryImpl({required CartRemoteDatasource cartRemoteDatasource})
      : _cartRemoteDatasource = cartRemoteDatasource;
  @override
  Future<Response<List<ProductEntity>>> getPRoducts(String id) async {
    try {
      ProductsListResponse response =
          await _cartRemoteDatasource.getProductsBySubcategory(id);
      return Success(data: response.data ?? []);
    } catch (e) {
      return FailureResponse(failure: Failure.handelError(e));
    }
  }
}
