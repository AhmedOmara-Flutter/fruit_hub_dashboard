import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const InfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColor.border.withOpacity(.7),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            flex: 4,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}