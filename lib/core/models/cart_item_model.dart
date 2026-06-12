
import 'package:fruit_hub_dashboard/core/entities/cart_item_entity.dart';

import 'product_model.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.product,
    required super.unitPrice,
    required super.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      product: ProductModel.fromJson(json['product']).toEntity(),
      unitPrice: json['unitPrice'],
      quantity:json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': ProductModel.fromEntity(product).toJson(),
      'unitPrice': unitPrice,
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      product: entity.product,
      unitPrice: entity.unitPrice,
      quantity: entity.quantity,
    );
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      unitPrice: unitPrice,
      product: product,
      quantity: quantity,
    );
  }
}