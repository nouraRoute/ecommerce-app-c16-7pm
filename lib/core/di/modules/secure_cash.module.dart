import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SecureCashModule {
  @singleton
  FlutterSecureStorage getSecureStorage() {
    AndroidOptions getAndroidOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    FlutterSecureStorage storage =
        FlutterSecureStorage(aOptions: getAndroidOptions);
    return storage;
  }
}
