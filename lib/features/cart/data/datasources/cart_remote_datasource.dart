import 'package:ecommerce_app/features/cart/data/api/cart_api.dart';
import 'package:ecommerce_app/features/cart/data/models/products_list_reponse/products_list_response.dart';
import 'package:injectable/injectable.dart';

abstract class CartRemoteDatasource {
  Future<ProductsListResponse> getProductsBySubcategory(String id);
}

@Injectable(as: CartRemoteDatasource)
class CartRemoteDatasourceImpl implements CartRemoteDatasource {
  final CartApi _cartApi;

  CartRemoteDatasourceImpl({required CartApi cartApi}) : _cartApi = cartApi;
  @override
  Future<ProductsListResponse> getProductsBySubcategory(String id) async =>
      _cartApi.getProductsBySubcategory(id);
}
