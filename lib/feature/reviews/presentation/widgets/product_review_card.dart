import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../add_product/domain/entities/product_entity.dart';

class ProductReviewCard extends StatelessWidget {
  final ProductEntity product;

  const ProductReviewCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                product.image??'',
                width: 110,
                height: 110,
                fit: BoxFit.cover
                ,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.name}',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: Colors.black),
                ),

                const SizedBox(height: 4),

                Text('${product.category}', style: Theme.of(context).textTheme.labelLarge),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      '${product.averageRating}',
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(color: Colors.black),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '(${product.reviewsCount} تقييم)',
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall!.copyWith(color: Colors.black),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  '${product.price} جنيه',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: AppColor.mainColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
