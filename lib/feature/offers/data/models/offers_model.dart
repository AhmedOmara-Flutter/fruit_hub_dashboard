import '../../domain/entities/offers_entity.dart';

class OffersModel extends OffersEntity {
  OffersModel({
    required super.id,
    required super.productId,
    required super.discountPercentage,
    required super.startDate,
    required super.endDate,
  });

  factory OffersModel.fromEntity(OffersEntity entity) {
    return OffersModel(
      id: entity.id,
      productId: entity.productId,
      discountPercentage: entity.discountPercentage,
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
  }

  OffersEntity toEntity() {
    return OffersEntity(
      id: id,
      productId: productId,
      discountPercentage: discountPercentage,
      startDate: startDate,
      endDate: endDate,
    );
  }


  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
      id: json['id'],
      productId: json['product_id'],
      discountPercentage: json['discount_percentage'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'discount_percentage': discountPercentage,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
    };
  }
}
