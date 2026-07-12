import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
    required this.time,
    required this.totalPrice,
    required this.deliveryCost,
  });

  final String time;
  final double totalPrice;
  final double deliveryCost;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(7.w),
            decoration: BoxDecoration(
              color: AppColor.mainColor.withOpacity(.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.access_time_rounded,
              size: 16.sp,
              color: AppColor.mainColor,
            ),
          ),

          SizedBox(width: 10.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'وقت الطلب',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                time,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.textPrimary,
                ),
              ),
            ],
          ),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الإجمالي',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),

              SizedBox(height: 4.h),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                width: 60.w,
                height: 1.h,
                color: AppColor.border,
              ),

              Text(
                '${(totalPrice + deliveryCost).toStringAsFixed(2)} ج.م',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}