import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/core/helper_function/get_date_formate.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

import '../../../../core/enums/order_enum.dart';

class OrderHeaderSection extends StatelessWidget {
  const OrderHeaderSection({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: AppColor.mainColor.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.receipt_long_rounded,
                  color: AppColor.mainColor,
                  size: 20.sp,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تفاصيل الطلب',
                      style: StyleManager.font13Weight600.copyWith(color: AppColor.white),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  color: order.status.color.withOpacity(.15),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  order.status.ar,
                  style: StyleManager.font13Weight700.copyWith(
                    color: order.status.color,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.only(right:10.w),

            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 15.sp,
                  color: AppColor.textSecondary,
                ),

                SizedBox(width: 4.w),

                Text(
                  getDateFormate(order.createdAt.toString()),
                  style: StyleManager.font12Weight500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}