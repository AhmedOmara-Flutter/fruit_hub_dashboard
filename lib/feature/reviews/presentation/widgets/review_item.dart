import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/route_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ReviewItem extends StatelessWidget {
  final ProductEntity product;

  const ReviewItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: AppColor.border,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '${product.reviewsCount}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.white),
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.message,
                      color: AppColor.textSecondary,
                      size: 18.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 5.h),

          Column(
            children: [
              CachedNetworkImage(
                width: 110.w,
                height: 110.w,
                imageUrl: product.image!,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: Skeletonizer(
                    child: SizedBox(),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: AppColor.background,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        color: AppColor.border,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 50.sp,
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                product.name,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColor.white
                ),
              ),

              SizedBox(height: 10.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: AppColor.mainColor,
                    size: 16.sp,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    product.averageRating.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColor.mainColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteManager.productReviews,
                        arguments: product,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 15.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.border,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        'عرض جميع التعليقات',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(
                          color: AppColor.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}