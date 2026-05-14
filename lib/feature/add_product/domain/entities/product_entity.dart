import 'dart:io';

import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/review_entity.dart';

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
  final double avgRating;
  final int ratingCount;
  final int sellingCount;

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
    this.avgRating = 0.0,
    this.ratingCount = 0,
    this.sellingCount=0,

  });
}
