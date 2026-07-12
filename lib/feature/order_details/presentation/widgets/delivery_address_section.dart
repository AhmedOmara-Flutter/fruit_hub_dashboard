import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

class DeliveryAddressSection extends StatelessWidget {
  const DeliveryAddressSection({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final address = order.addressEntity!;
    final location = order.selectedLocationEntity!;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'عنوان التوصيل',
            style: StyleManager.font13Weight600.copyWith(
              color: AppColor.white,
            ),
          ),

          SizedBox(height: 12.h),

          _AddressTile(
            icon: Icons.map_outlined,
            title: 'المنطقة',
            value: location.title,
          ),

          SizedBox(height: 8.h),

          _AddressTile(
            icon: Icons.apartment_rounded,
            title: 'الشقة / العمارة',
            value: address.apartment,
          ),

          SizedBox(height: 8.h),

          _AddressTile(
            icon: Icons.location_on_outlined,
            title: 'العنوان',
            value: address.address,
          ),
        ],
      ),
    );
  }
}

class _AddressTile extends StatelessWidget {
  const _AddressTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
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
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              color: AppColor.mainColor.withOpacity(.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColor.mainColor,
              size: 16.sp,
            ),
          ),

          SizedBox(width: 10.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: StyleManager.font11Weight400,
                ),

                SizedBox(height: 2.h),

                Text(
                  value,
                  style: StyleManager.font12Weight500.copyWith(
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}