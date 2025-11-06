import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Response<void>> login(
      {required String email, required String password});
  Future<Response<void>> register({required UserEntity user});
  Future<bool> checkIsLogged();
}
