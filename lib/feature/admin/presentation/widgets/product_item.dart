import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../generated/assets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productName,
    required this.orderCount,
    required this.image,
    required this.quantity,
  });

  final String productName;
  final String orderCount;
  final String image;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                quantity.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(
                  color: Colors.white,
                  ))
            ),
          ),

          const SizedBox(width: 12),

          ClipRRect(borderRadius: BorderRadiusGeometry.circular(8),
            child: CachedNetworkImage(
              imageUrl: image,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                  Skeletonizer(child: Image.asset(Assets.images.img.path),),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: Colors.red),
            ),

          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  '$orderCount طلب',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
