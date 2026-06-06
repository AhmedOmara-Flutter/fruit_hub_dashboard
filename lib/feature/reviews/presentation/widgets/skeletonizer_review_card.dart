import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/reviews/domain/entities/review_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../generated/assets.dart';

class SkeletonizerReviewCard extends StatelessWidget {
  final ReviewEntity review;

  const SkeletonizerReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration:BoxDecoration(
                        shape: BoxShape.circle
                    ) ,
                    child: CachedNetworkImage(imageUrl: review.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Skeletonizer(child: CircleAvatar(
                            backgroundImage: AssetImage(Assets.images.img.path),
                          ),),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                ),              const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            review.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: List.generate(
                              5,
                                  (i) => Icon(
                                i < review.rating ? Icons.star : Icons.star_border,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ),
                          ),
      
                        ],
                      ),
      
                      const SizedBox(height: 4),
                      Text(
                        review.date ?? "",
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
      
                      Text(review.reviewDescription, style: const TextStyle(height: 1.4)),
      
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
