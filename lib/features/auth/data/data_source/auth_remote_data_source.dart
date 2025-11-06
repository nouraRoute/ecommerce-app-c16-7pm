import 'package:ecommerce_app/features/auth/data/data_source/api/auth_apis.dart';
import 'package:ecommerce_app/features/auth/data/model/auth_response_model.dart';
import 'package:ecommerce_app/features/auth/data/model/user_model/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(
      {required String email, required String password});
  Future<AuthResponseModel> signup({required UserModel user});
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApis _authApis;

  AuthRemoteDataSourceImpl({required AuthApis authApis}) : _authApis = authApis;
  @override
  Future<AuthResponseModel> login(
      {required String email, required String password}) async {
    AuthResponseModel response =
        await _authApis.login({'email': email, 'password': password});
    return response;
  }

  @override
  Future<AuthResponseModel> signup({required UserModel user}) async {
    AuthResponseModel response = await _authApis.signup(user);
    return response;
  }
}
