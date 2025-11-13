import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/cart/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';

class GetProductsBySubcategoryUsecase {
  final CartRepository _cartRepository;

  GetProductsBySubcategoryUsecase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  Future<Response<List<ProductEntity>>> call(String id) async =>
      await _cartRepository.getPRoducts(id);
}
