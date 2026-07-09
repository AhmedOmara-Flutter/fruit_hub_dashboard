import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItem extends StatelessWidget {
  final double amount;
  final String status;
  final Color statusColor;
  final String customerName;
  final String time;
  final String products;
  final double deliveryCost;

  const OrderItem({
    super.key,
    required this.amount,
    required this.status,
    required this.statusColor,
    required this.customerName,
    required this.time,
    required this.products,
    required this.deliveryCost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  customerName,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.textPrimary,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  products,
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
                      time,
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
                  status,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: statusColor,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              Text(
                '${(amount + deliveryCost).toStringAsFixed(2)} ج.م',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColor.mainColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}