import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/helper_function/get_date_formate.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/reviews/domain/entities/review_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../generated/assets.dart';

class ReviewCard extends StatelessWidget {
  final ReviewEntity review;

  const ReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              Assets.images.customer.path,
              width: 45.w,
              height: 45.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 10.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        review.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                          color: AppColor.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.mainColor.withOpacity(.12),
                        borderRadius:
                        BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: List.generate(
                          5,
                              (i) => Icon(
                            i < review.rating
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            size: 14.sp,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                Text(
                  getDateFormate(review.date),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(
                    color: AppColor.textSecondary,
                    fontSize: 11.sp,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  review.reviewDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: AppColor.textSecondary,
                    fontSize: 12.5.sp,
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