import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/utils/app_color.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 75.w,
            height: 75.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppColor.border,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: EdgeInsets.all(6.w),
              child: CachedNetworkImage(
                imageUrl: product.image ?? '',
                fit: BoxFit.contain,
                errorWidget: (context, url, error) => Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColor.textSecondary,
                  size: 30.sp,
                ),
              ),
            ),
          ),          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6.h),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.mainColor.withOpacity(.12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    product.category,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColor.mainColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColor.mainColor,
                      size: 18.sp,
                    ),

                    SizedBox(width: 4.w),

                    Text(
                      product.averageRating.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColor.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Text(
                      '(${product.reviewsCount})',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Text(
            '${product.price} ج',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColor.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}