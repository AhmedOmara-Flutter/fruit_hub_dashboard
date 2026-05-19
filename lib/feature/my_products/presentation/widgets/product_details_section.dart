import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_detail_item.dart';

class ProductDetailsSection extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsSection(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: ProductDetailItem(
              title: 'المخزون',
              value: '50',
              subValue: 'قطعة',
            ),
          ),

          VerticalDivider(color: Colors.grey.shade300, thickness: 1),

          Expanded(
            child: ProductDetailItem(title: 'التصنيف', value: product.category),
          ),

          VerticalDivider(color: Colors.grey.shade300, thickness: 1),

          Expanded(
            child: ProductDetailItem(
              title: 'تاريخ الإضافة',
              value: product.createdAt,
              subValue: '11:15 ص',
            ),
          ),
        ],
      ),
    );
  }
}
