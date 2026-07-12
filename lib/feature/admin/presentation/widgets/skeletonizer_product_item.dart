import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../generated/assets.dart';

class SkeletonizerProductItem extends StatelessWidget {
  const SkeletonizerProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        baseColor: Color(0xFF2A2A2A),
        highlightColor: Color(0xFF3A3A3A),
        duration: Duration(milliseconds: 1200),
      ),
      child: Container(
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
              Assets.images.customer.path, // غيرها باسم الميدالية عندك
              height: 30.w,
              width: 30.w,
            ),

            SizedBox(width: 12.w),

            Container(
              width: 65.w,
              height: 65.w,
              decoration: BoxDecoration(
                color: AppColor.background,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColor.border,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  Assets.images.customer.path, // غيرها بصورة منتج عندك
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'بيتزا سوبر سوبريم',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: StyleManager.font15Weight700,
                  ),

                  SizedBox(height: 6.h),

                  Text(
                    '125 طلب',
                    style: StyleManager.font13Weight400,
                  ),
                ],
              ),
            ),

            SizedBox(width: 12.w),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: AppColor.background.withOpacity(.12),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColor.border,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '125',
                        style: StyleManager.font14Weight600,
                      ),
                      SizedBox(width: 4.w),
                      Image.asset(
                        Assets.images.rise.path,
                        height: 10.h,
                        width: 10.w,
                        color: AppColor.mainColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'إجمالي الطلبات',
                    style: StyleManager.font11Weight400,
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