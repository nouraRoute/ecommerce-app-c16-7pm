import 'package:ecommerce_app/features/auth/data/model/user_model/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user_entity.dart';

extension UserMapper on UserEntity {
  UserModel get getModel => UserModel(
      email: email, name: name, password: password, rePassword: password);
}
