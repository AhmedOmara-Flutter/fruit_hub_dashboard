import 'package:fruit_hub_dashboard/core/entities/address_entity.dart';
import 'package:fruit_hub_dashboard/core/entities/cart_entity.dart';
import 'package:fruit_hub_dashboard/core/entities/selected_location_entity.dart';
import 'package:fruit_hub_dashboard/core/entities/user_entity.dart';

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
  SelectedLocationEntity ?selectedLocationEntity;



  OrderEntity({
    required this.cartEntity,
    this.isCashOnDelivery,
    this.addressEntity,
    required this.uId,
    this.createdAt,
    this.userEntity,required this.status,
     this.id,
    this.selectedLocationEntity,
  });

  OrderEntity copyWith({
    String? uId,
    String? id,
    DateTime? createdAt,
    CartEntity? cartEntity,
    bool? isCashOnDelivery,
    AddressEntity? addressEntity,
    UserEntity? userEntity,
    OrderStatus? status,
    SelectedLocationEntity? selectedLocationEntity,
  }) {
    return OrderEntity(
      uId: uId ?? this.uId,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      cartEntity: cartEntity ?? this.cartEntity,
      isCashOnDelivery: isCashOnDelivery ?? this.isCashOnDelivery,
      addressEntity: addressEntity ?? this.addressEntity,
      userEntity: userEntity ?? this.userEntity,
      status: status ?? this.status,
      selectedLocationEntity:
      selectedLocationEntity ?? this.selectedLocationEntity,
    );
  }
  String getFullAddress() {
    return '${addressEntity!.address}, ${addressEntity!.country}, ${addressEntity!.apartment}';
  }

  double getTotalDeliveryCost(List<OrderEntity> orders) {
    double total = 0;

    for (final order in orders) {
      total += order.selectedLocationEntity?.cost ?? 0;
    }

    return total;
  }
}
