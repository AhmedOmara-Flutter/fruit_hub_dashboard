import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  AddProductModel({
    required super.name,
    required super.code,
    required super.price,
    required super.description,
    required super.imageFile,
    required super.isFeatured,
    super.image,
    required super.expirationMonth,
    required super.unitAmount,
    required super.numberOfCalories,
    super.isOrganic = false,
    super.rating = 0.0,
    super.reviews = 0,
  });

  factory AddProductModel.fromEntity(AddProductEntity entity) {
    return AddProductModel(
      name: entity.name,
      code: entity.code,
      price: entity.price,
      description: entity.description,
      imageFile: entity.imageFile,
      isFeatured: entity.isFeatured,
      image: entity.image,
      expirationMonth: entity.expirationMonth,
      unitAmount: entity.unitAmount,
      numberOfCalories: entity.numberOfCalories,
      isOrganic: entity.isOrganic,
      rating: entity.rating,
      reviews: entity.reviews,
    );
  }

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      name: json['name'],
      code: json['code'],
      price: json['price'],
      description: json['description'],
      imageFile: json['imageFile'],
      isFeatured: json['isFeatured'],
      image: json['image'],
      expirationMonth: json['expirationMonth'],
      unitAmount: json['unitAmount'],
      numberOfCalories: json['numberOfCalories'],
      isOrganic: json['isOrganic'],
      rating: json['rating'],
      reviews: json['reviews'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'price': price,
      'description': description,
      'isFeatured': isFeatured,
      'image': image,
      'expirationMonth': expirationMonth,
      'unitAmount': unitAmount,
      'numberOfCalories': numberOfCalories,
      'isOrganic': isOrganic,
      'rating': rating,
      'reviews': reviews,
    };
  }
}
