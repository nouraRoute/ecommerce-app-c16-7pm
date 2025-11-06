import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDataSource {
  Future<void> setToken(String token);
  Future<String?> getToken();
  //TODO:get user ,set user
}

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _flutterSecureStorage;

  AuthLocalDataSourceImpl({required FlutterSecureStorage flutterSecureStorage})
      : _flutterSecureStorage = flutterSecureStorage;
  @override
  Future<String?> getToken() async {
    try {
      String? token =
          await _flutterSecureStorage.read(key: AppConstants.tokenKey);
      return token;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setToken(String token) async {
    try {
      await _flutterSecureStorage.write(
          key: AppConstants.tokenKey, value: token);
    } on Exception catch (e) {
      // TODO
    }
  }
}
