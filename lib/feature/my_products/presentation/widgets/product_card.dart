import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_actions_section.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_details_section.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_header_section.dart';

import '../../../offers/domain/entities/offer_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final OfferEntity? offer;

  const ProductCard({super.key, required this.product, this.offer});




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProductHeaderSection(product),
            const SizedBox(height: 8),
            ProductActionsSection(product),
            SizedBox(height: 10),
            ProductDetailsSection(product),
          ],
        ),
      ),
    );
  }
}
