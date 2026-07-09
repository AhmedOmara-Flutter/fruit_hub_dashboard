import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';

class StatisticsCard extends StatelessWidget {
  final StatisticsCardModel model;

  const StatisticsCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: model.color,
                  radius: 20.r,
                  child: Icon(
                    model.icon,
                    color: AppColor.white,
                    size: 22.sp,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColor.textPrimary,
                  ),
                ),
              ],
            ),

            SizedBox(height: 5.h),

            Text(
              model.subTitleNumber,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: AppColor.textPrimary,
              ),
            ),

            SizedBox(height: 5.h),

            Text(
              model.subTitleText,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsCardModel {
  final Color color;
  final IconData icon;
  final String title;
  final String subTitleNumber;
  final String subTitleText;
  final void Function()? onTap;

  StatisticsCardModel({
    required this.color,
    required this.icon,
    required this.title,
    required this.subTitleNumber,
    required this.subTitleText,
    this.onTap,
  });
}