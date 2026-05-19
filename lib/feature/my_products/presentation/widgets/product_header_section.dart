import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_image.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_info.dart';

class ProductHeaderSection extends StatelessWidget {
  final ProductEntity product;

  const ProductHeaderSection(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ProductImage(product)),
        const SizedBox(width: 10),
        Expanded(flex:2,child: ProductInfo(product)),
      ],
    );
  }
}
