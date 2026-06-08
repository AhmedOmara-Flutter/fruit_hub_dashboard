import 'package:equatable/equatable.dart';

class OffersEntity extends Equatable {
  final String? id;
  final String productId;
  final double discountPercentage;
  final DateTime startDate;
  final DateTime endDate;

  OffersEntity({
    required this.id,
    required this.productId,
    required this.discountPercentage,
    required this.startDate,
    required this.endDate,
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
