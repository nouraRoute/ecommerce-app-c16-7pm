import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? name;
  String? email;
  @JsonKey(includeToJson: false)
  String? role;
  String? password;
  String? rePassword;

  UserModel({
    this.name,
    this.email,
    this.role,
    this.password,
    this.rePassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
