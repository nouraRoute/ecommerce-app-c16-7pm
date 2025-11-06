//TODO: di,return type
import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final AuthRepository _authRepository;

  LoginUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  Future<Response<void>> call(
          {required String email, required String password}) async =>
      await _authRepository.login(email: email, password: password);
}
