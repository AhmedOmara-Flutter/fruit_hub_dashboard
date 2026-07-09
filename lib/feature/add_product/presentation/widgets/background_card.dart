import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class BackgroundCard extends StatelessWidget {
  final Widget child;
  final String label;
  final String subLabel;
  final IconData icon;

  const BackgroundCard({
    super.key,
    required this.child,
    required this.label,
    required this.subLabel,
    required this.icon,
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
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
              border: Border.all(
                color: AppColor.border,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    icon,
                    color: AppColor.white,
                    size: 18.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subLabel,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}