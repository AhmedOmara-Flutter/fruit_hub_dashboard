import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import '../entities/cart_entity.dart';
import 'address_model.dart';
import 'order_item_model.dart';

class OrderModel {
  final String uId;
  final String paymentMethod;
  final DateTime createdAt;
  final num totalPrice;
  final AddressModel address;
  final List<OrderItemModel> items;



  OrderModel({
    required this.uId,
    required this.paymentMethod,
    required this.address,
     required this.items,
    required this.totalPrice,
   required this.createdAt,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      uId: entity.uId,
      paymentMethod: entity.isCashOnDelivery == true ? 'Cash' : 'Online',
      createdAt: DateTime.now(),
      address: AddressModel.fromEntity(entity.addressEntity!),
      totalPrice: entity.cartEntity.getTotalPrice(),
      items: entity.cartEntity.cartItems.map((cartItem) => OrderItemModel.fromEntity(cartItem)).toList(),
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      uId: uId,
      createdAt: createdAt,
      isCashOnDelivery: paymentMethod == 'Cash' ? true : false,
      addressEntity: address.toEntity(),
      cartEntity: CartEntity(
        cartItems: items.map((item) => item.toEntity()).toList(),
      ),
    );
  }
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uId: json['uId'],
      totalPrice: json['totalPrice'],
      createdAt: (json['createdAt'] as Timestamp?)!.toDate(),
      address: AddressModel.fromJson(json['address']),
      paymentMethod: json['paymentMethod'],
      items: List<OrderItemModel>.from(json['items'].map((item) => OrderItemModel.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'paymentMethod': paymentMethod,
      'totalPrice': totalPrice,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'address': address.toJson(),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }


}
