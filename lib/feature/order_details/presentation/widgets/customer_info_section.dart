import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/core/helper_function/make_call_function.dart';
import 'package:fruit_hub_dashboard/core/helper_function/make_full_name.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';
import 'package:fruit_hub_dashboard/generated/assets.dart';

class CustomerInfoSection extends StatelessWidget {
  const CustomerInfoSection({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final user = order.userEntity!;

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
            'بيانات العميل',
            style: StyleManager.font13Weight600.copyWith(
              color: AppColor.white,
            ),
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColor.card,
                backgroundImage: AssetImage(
                  Assets.images.customer.path,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      makeFullName(user.userName),
                      style: StyleManager.font15Weight700,
                    ),

                    SizedBox(height: 2.h),

                    Text(
                      user.email,
                      style: StyleManager.font12Weight500,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          _InfoTile(
            icon: Icons.phone_rounded,
            title: 'رقم الهاتف',
            value: user.phone,
            onTap: () => makePhoneCall(user.phone),
          ),

          SizedBox(height: 10.h),

          _InfoTile(
            icon: Icons.person_outline_rounded,
            title: 'اسم المستلم',
            value: order.addressEntity!.name,
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
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
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(
                color: AppColor.mainColor.withOpacity(.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColor.mainColor,
                size: 17.sp,
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
                    style: StyleManager.font13Weight600.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}