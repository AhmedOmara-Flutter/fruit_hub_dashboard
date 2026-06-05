import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../generated/assets.dart';

class OrderItemSkeleton extends StatelessWidget {
  const OrderItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // image skeleton
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(Assets.images.img.path),
              ),
            ),
            const SizedBox(width: 12),
            // middle skeleton
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 20, child: Text('bhbuhbubuybnuy')),
                  const SizedBox(height: 10),
                  Container(height: 20, child: Text('buybnuy')),
                  Container(height: 20, child: Text('buybnuy')),
                  const SizedBox(height: 10),
                  Container(height: 20, child: Text('bunugggggy')),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // right side skeleton
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 18,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 12),
                Container(height: 40, child: Text('buybnuy')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
