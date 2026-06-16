import 'package:fruit_hub_dashboard/core/entities/address_entity.dart';
import 'package:fruit_hub_dashboard/core/entities/cart_entity.dart';
import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';
import 'package:fruit_hub_dashboard/core/utils/app_constants.dart';

import '../enums/order_enum.dart';

class OrderEntity {
  final String uId;
   String ?id;
  final DateTime? createdAt;
  final CartEntity cartEntity;
  bool? isCashOnDelivery;
  AddressEntity? addressEntity;
  UserEntity?userEntity;
  final OrderStatus status;

  OrderEntity({
    required this.cartEntity,
    this.isCashOnDelivery,
    this.addressEntity,
    required this.uId,
    this.createdAt,
    this.userEntity,required this.status,
     this.id
  });

  String getFullAddress() {
    return '${addressEntity!.address}, ${addressEntity!.country}, ${addressEntity!.apartment}';
  }
}
