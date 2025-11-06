import 'package:ecommerce_app/core/network/error_handling.dart';
import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/mapper/user_mapper.dart';
import 'package:ecommerce_app/features/auth/data/model/auth_response_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  AuthRepositoryImpl(this._authLocalDataSource,
      {required AuthRemoteDataSource authDataSource})
      : _authDataSource = authDataSource;
  @override
  Future<Response<void>> login(
      {required String email, required String password}) async {
    try {
      Logger().i('repository impl login');

      AuthResponseModel response =
          await _authDataSource.login(email: email, password: password);
      if (response.token != null) {
        _authLocalDataSource.setToken(response.token!);
      }
      return Success(data: null);
    } catch (e) {
      return FailureResponse(failure: Failure.handelError(e));
    }
  }

  @override
  Future<Response<void>> register({required UserEntity user}) async {
    try {
      AuthResponseModel response =
          await _authDataSource.signup(user: user.getModel);
      return Success(data: null);
    } catch (e) {
      return FailureResponse(failure: Failure.handelError(e));
    }
  }

  @override
  Future<bool> checkIsLogged() async {
    String? token = await _authLocalDataSource.getToken();
    return token != null;
  }
}
