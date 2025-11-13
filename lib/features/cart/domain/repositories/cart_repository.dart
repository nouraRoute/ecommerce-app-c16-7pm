import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/cart/domain/entities/product_entity.dart';

abstract class CartRepository {
  Future<Response<List<ProductEntity>>> getPRoducts(String id);
}
