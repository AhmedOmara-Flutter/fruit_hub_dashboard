import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final String? id;
  final String productId;
  final String image;
  final String name;
  final double priceBeforeDiscount;
  final double priceAfterDiscount;

  final double discountPercentage;
  final DateTime startDate;
  final DateTime endDate;

  OfferEntity({
    this.id,
    required this.productId,
    required this.discountPercentage,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.name,
    required this.priceBeforeDiscount,
    required this.priceAfterDiscount,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,
    productId,
    discountPercentage,
    startDate,
    endDate,
  ];
}
