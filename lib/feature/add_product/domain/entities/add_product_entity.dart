import 'dart:io';

class AddProductEntity {
  final String name;
  final String code;
  final num price;
  final String description;
  final File imageFile;
  final bool isFeatured;
   String? image;

  AddProductEntity({
    required this.name,
    required this.code,
    required this.price,
    required this.description,
    required this.imageFile,
    required this.isFeatured,
     this.image,
  });
}
