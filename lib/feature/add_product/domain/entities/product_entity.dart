import 'dart:io';

class ProductEntity {
  final String name;
  final String code;
  final num price;
  final String description;
  final File imageFile;
  final bool isFeatured;
  String? image;
  final num expirationMonth;
  final num unitAmount;
  final num numberOfCalories;
  final bool isOrganic;
  final double rating;
  final int reviews;

  ProductEntity({
    required this.name,
    required this.code,
    required this.price,
    required this.description,
    required this.imageFile,
    required this.isFeatured,
    this.image,
    required this.expirationMonth,
    required this.unitAmount,
    required this.numberOfCalories,
    this.isOrganic = false,
    this.rating = 0.0,
    this.reviews = 0,
  });
}
