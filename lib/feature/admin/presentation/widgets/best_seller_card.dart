import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';
import 'best_seller_list_view.dart';

class BestSellerCard extends StatelessWidget {
  const BestSellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: [
              Icon(
                Icons.local_fire_department_rounded,
                color: AppColor.mainColor,
                size: 22.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                'أفضل المنتجات مبيعًا',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColor.textPrimary,
                ),
              ),
            ],
          ),          SizedBox(height: 20.h),
          const BestSellerListView(),
        ],
      ),
    );
  }
}
