import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

class AddProductModel extends ProductEntity {
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
    super.avgRating = 0.0,
    super.ratingCount = 0,
    super.sellingCount=0,
  });

  factory AddProductModel.fromEntity(ProductEntity entity) {
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
      avgRating: entity.avgRating,
      ratingCount: entity.ratingCount,
      sellingCount: entity.sellingCount,
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
      avgRating: json['avgRating'],
      ratingCount: json['ratingCount'],
      sellingCount: json['sellingCount'],
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
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'sellingCount': sellingCount,
    };
  }
}
