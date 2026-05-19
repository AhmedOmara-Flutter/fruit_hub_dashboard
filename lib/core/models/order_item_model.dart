
import 'package:fruit_hub_dashboard/core/entities/cart_item_entity.dart';
import 'package:fruit_hub_dashboard/core/models/cart_item_model.dart';

class OrderItemModel {
  final String code;
  final String name;
  final String imageUrl;
  final num price;
  final int quantity;

  OrderItemModel({
    required this.code,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderItemModel.fromEntity(CartItemEntity entity) {
    return OrderItemModel(
      code: entity.product.code,
      name: entity.product.name,
      imageUrl: entity.product.image!,
      price: entity.product.price,
      quantity: entity.quantity,
    );
  }


  CartItemEntity toEntity() {
    return CartItemModel.fromJson({
      'product': {
        'code': code,
        'name': name,
        'image': imageUrl,
        'price': price,
      },
      'quantity': quantity,
    }).toEntity();
  }
  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      code: json['code'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };

  }
}
