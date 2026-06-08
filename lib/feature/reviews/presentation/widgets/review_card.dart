import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/reviews/domain/entities/review_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../generated/assets.dart';

class ReviewCard extends StatelessWidget {
  final ReviewEntity review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: review.image,
              height: 45,
              width: 45,
              fit: BoxFit.cover,
              placeholder: (context, url) => Skeletonizer(
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(Assets.images.img.path),
                ),
              ),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error, color: Colors.red, size: 20),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// name + rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        review.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: List.generate(5, (i) {
                          return Icon(
                            i < review.rating
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            size: 14,
                            color: Colors.amber,
                          );
                        }),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                /// date
                Text(
                  review.date ?? "",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade500,
                  ),
                ),

                const SizedBox(height: 6),

                /// review text
                Text(
                  review.reviewDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.grey.shade700,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}