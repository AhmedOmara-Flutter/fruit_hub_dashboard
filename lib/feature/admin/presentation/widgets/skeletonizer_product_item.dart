import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../generated/assets.dart';

class SkeletonizerProductItem extends StatelessWidget {
  const SkeletonizerProductItem({
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
    return Skeletonizer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Color(0xffEBEBF4),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                    child:Image.network(image)
                ),

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
                    Image.asset(Assets.images.img.path),
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
      ),
    );
  }
}
