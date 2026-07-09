import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productName,
    required this.orderCount,
    required this.image,
    required this.medal,
  });

  final String productName;
  final String orderCount;
  final String image;
  final String medal;

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
          Image.asset(
            medal,
            height: 30.w,
            width: 30.w,
          ),

          SizedBox(width: 12.w),

          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColor.mainColor.withOpacity(.12),
                  AppColor.mainColor.withOpacity(.05),
                ],
              ),
              border: Border.all(
                color: AppColor.mainColor.withOpacity(.15),
              ),
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  productName,
                  style: Theme.of(context).textTheme.labelLarge,
                ),

                SizedBox(height: 4.h),

                Text(
                  '$orderCount طلب',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColor.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 7.h,
            ),
            decoration: BoxDecoration(
              color: AppColor.mainColor.withOpacity(.08),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      orderCount,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(
                        color: AppColor.mainColor,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Image.asset(
                      Assets.images.rise.path,
                      height: 10.w,
                      width: 10.w,
                      color: AppColor.mainColor,
                    ),
                  ],
                ),

                SizedBox(height: 2.h),

                Text(
                  'إجمالي الطلبات',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 11.sp,
                    color: AppColor.textSecondary,
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