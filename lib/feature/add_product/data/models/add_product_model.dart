import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  AddProductModel({
    required super.name,
    required super.code,
    required super.price,
    required super.description,
    required super.imageFile,
    required super.isFeatured,
  });

  factory AddProductModel.fromEntity(AddProductEntity entity) {
    return AddProductModel(
      name: entity.name,
      code: entity.code,
      price: entity.price,
      description: entity.description,
      imageFile: entity.imageFile,
      isFeatured: entity.isFeatured,
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'price': price,
      'description': description,
      'imageFile': imageFile,
      'isFeatured': isFeatured,
    };
  }
}
