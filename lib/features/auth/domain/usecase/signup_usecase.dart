//TODO: di,return type
import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUsecase {
  final AuthRepository _authRepository;

  SignupUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  Future<Response<void>> call({required UserEntity user}) =>
      _authRepository.register(user: user);
}
