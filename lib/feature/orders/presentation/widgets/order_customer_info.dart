import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_function/make_call_function.dart';
import '../../../../core/utils/app_color.dart';

class OrderCustomerInfo extends StatelessWidget {
  const OrderCustomerInfo({
    super.key,
    required this.customerName,
    required this.orderId,
    required this.address,
    required this.products,
    required this.price,
    required this.phone,
    required this.location,
  });

  final String customerName;
  final String orderId;
  final String address;
  final String products;
  final String price;
  final String phone;
  final String location;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          customerName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: AppColor.textPrimary,
          ),
        ),

        SizedBox(height: 4.h),

        Text(
          '#اوردر - $orderId',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: AppColor.textSecondary,
          ),
        ),

        SizedBox(height: 6.h),

        Row(
          children: [
            Icon(
              Icons.phone,
              color: AppColor.mainColor,
              size: 16.sp,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                phone,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 4.h),

        Row(
          children: [
            Icon(
              Icons.business_outlined,
              color: AppColor.mainColor,
              size: 16.sp,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                location,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 4.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              color: AppColor.mainColor,
              size: 16.sp,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                address,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 6.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                products,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.mainColor,
                ),
              ),
            ),

            SizedBox(width: 8.w),

            Text(
              price,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColor.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}