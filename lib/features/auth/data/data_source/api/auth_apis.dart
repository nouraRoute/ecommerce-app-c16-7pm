import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/auth/data/model/auth_response_model.dart';
import 'package:ecommerce_app/features/auth/data/model/user_model/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_apis.g.dart';

@injectable
@RestApi()
abstract class AuthApis {
  @factoryMethod
  factory AuthApis(Dio dio) = _AuthApis;
  @POST(Endpoints.login)
  Future<AuthResponseModel> login(
    @Body() Map<String, dynamic> map,
  );
  @POST(Endpoints.signup)
  Future<AuthResponseModel> signup(
    @Body() UserModel user,
  );
}
