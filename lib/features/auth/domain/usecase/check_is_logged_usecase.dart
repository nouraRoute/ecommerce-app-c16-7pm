import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckIsLoggedUsecase {
  final AuthRepository _authRepository;

  CheckIsLoggedUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  Future<bool> call() => _authRepository.checkIsLogged();
}
