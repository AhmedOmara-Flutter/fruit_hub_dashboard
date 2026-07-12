import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';
import 'package:fruit_hub_dashboard/generated/assets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerOrderItem extends StatelessWidget {
  const SkeletonizerOrderItem({super.key});

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
        margin: EdgeInsets.symmetric(
          vertical: 6.h,
        ),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColor.card,
          borderRadius: BorderRadius.circular(18.r),
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
                width: 68.w,
                height: 68.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ahmed Mohamed',
                    style: StyleManager.font13Weight600.copyWith(
                      color: AppColor.mainColor,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Text(
                    'كريب سوبر + بيتزا رانش + ',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 14.sp,
                        color: AppColor.textSecondary,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'منذ 5 دقائق',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: 10.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Colors.orange,
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                Text(
                  '250.00 ج.م',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: AppColor.mainColor,
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