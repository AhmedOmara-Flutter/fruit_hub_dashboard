class UserEntity {
  final String userName;
  final String email;
  final String uId;
  final String phone;
  final String? fcmToken;

  UserEntity({
    required this.userName,
    required this.email,
    required this.uId,
    required this.phone,
    this.fcmToken,
  });
}
