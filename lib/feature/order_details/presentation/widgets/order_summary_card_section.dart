import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

class OrderSummaryCardSection extends StatelessWidget {
  const OrderSummaryCardSection({
    super.key,
    required this.subTotal,
    required this.deliveryCost,
  });

  final double subTotal;
  final double deliveryCost;

  @override
  Widget build(BuildContext context) {
    final total = subTotal + deliveryCost;

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
            'ملخص الفاتورة',
            style: StyleManager.font13Weight600.copyWith(
              color: AppColor.white,
            ),
          ),

          SizedBox(height: 12.h),

          _SummaryRow(
            title: 'إجمالي المنتجات',
            value: '${subTotal.toStringAsFixed(2)} ج.م',
          ),

          SizedBox(height: 8.h),

          _SummaryRow(
            title: 'رسوم التوصيل',
            value: '${deliveryCost.toStringAsFixed(2)} ج.م',
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(
              color: AppColor.border,
              height: 1,
            ),
          ),

          Container(
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
                Text(
                  'الإجمالي',
                  style: StyleManager.font12Weight500.copyWith(
                    color: AppColor.white,
                  ),
                ),

                const Spacer(),

                Text(
                  '${total.toStringAsFixed(2)} ج.م',
                  style: StyleManager.font13Weight700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.title,
    required this.value,
  });

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
          Text(
            title,
            style: StyleManager.font11Weight400,
          ),
          const Spacer(),
          Text(
            value,
            style: StyleManager.font12Weight500.copyWith(
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}