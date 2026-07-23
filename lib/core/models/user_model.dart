import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userName,
    required super.email,
    required super.uId,
    required super.phone,
    required super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      uId: json['uId'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      userName: user.userName,
      email: user.email,
      uId: user.uId,
      phone: user.phone,
      password: user.password,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      userName: userName,
      email: email,
      uId: uId,
      phone: phone,
      password: password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'uId': uId,
      'phone': phone,
      'password': password,
    };
  }
}
