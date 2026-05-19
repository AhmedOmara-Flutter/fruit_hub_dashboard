import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_actions_section.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_details_section.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_header_section.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity products;

  const ProductCard(this.products, {super.key});

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
            ProductHeaderSection(products),
            const SizedBox(height: 8),
            ProductActionsSection(),
            SizedBox(height: 10),
            ProductDetailsSection(products),
          ],
        ),
      ),
    );
  }
}
