import 'dart:io';

class ProductEntity {
  final String ?id;
  final String name;
  final String code;
  final num price;
  final String description;
  final File ?imageFile;
  final bool isFeatured;
  String? image;
  final num expirationMonth;
  final num unitAmount;
  final num numberOfCalories;
  final bool isOrganic;
  final int sellingCount;
  final List<File> ?subImagesFiles;
  List<String> ?subImages;
  final String category;
  final String createdAt;
  double averageRating;
  int reviewsCount;
  double ratingSum;


  ProductEntity({
    required this.name,
    required this.code,
    required this.price,
    required this.description,
     this.imageFile,
    required this.isFeatured,
    this.image,
    required this.expirationMonth,
    required this.unitAmount,
    required this.numberOfCalories,
    this.isOrganic = false,
    this.sellingCount = 0,
     this.subImagesFiles,
    this.subImages,
    required this.category,
    required this.createdAt,
    this.id,
    this.averageRating = 0.0,
    this.reviewsCount = 0,
    this.ratingSum = 0.0,
  });
}


