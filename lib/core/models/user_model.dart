import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userName,
    required super.email,
    required super.uId,
    required super.image,
    required super.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      uId: json['uId'],
      image: json['image'],
      phone: json['phone'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      userName: user.userName,
      email: user.email,
      uId: user.uId,
      image: user.image,
      phone: user.phone,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      userName: userName,
      email: email,
      uId: uId,
      image: image,
      phone: phone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'uId': uId,
      'image': image,
      'phone': phone,
    };
  }
}
