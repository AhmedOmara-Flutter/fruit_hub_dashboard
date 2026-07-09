import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';

class CustomIsFeatured extends StatelessWidget {
  final bool isFeatured;
  final Function()? onTap;

  const CustomIsFeatured({
    super.key,
    required this.isFeatured,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w),
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: isFeatured
                  ? AppColor.mainColor
                  : AppColor.card,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColor.border,
              ),
            ),
            child: isFeatured
                ? Icon(
              Icons.done,
              size: 17.sp,
              color: AppColor.white,
            )
                : null,
          ),
          Text(
            'المنتج مميز',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColor.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}