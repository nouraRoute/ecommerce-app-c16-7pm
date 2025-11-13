import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/cart/data/models/products_list_reponse/products_list_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api.g.dart';

@injectable
@RestApi()
abstract class CartApi {
  @factoryMethod
  factory CartApi(Dio dio) = _CartApi;

  @GET(Endpoints.products)
  Future<ProductsListResponse> getProductsBySubcategory(
      @Query("category") String category);
}
