import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
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
    super.sellingCount=0, required super.subImages,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
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
      subImages: entity.subImages,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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
      subImages: json['subImages'],
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

