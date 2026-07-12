import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/style_manager.dart';

class OrderTotalSection extends StatelessWidget {
  final double total;
  final double delivery;

  const OrderTotalSection({
    super.key,
    required this.total,
    required this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    final finalTotal = total + delivery;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Column(
        children: [
          _RowItem(
            title: 'إجمالي المنتجات',
            value: '${total.toStringAsFixed(2)} ج.م',
          ),

          SizedBox(height: 8.h),

          _RowItem(
            title: 'التوصيل',
            value: '${delivery.toStringAsFixed(2)} ج.م',
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(
              color: AppColor.border,
              height: 1,
            ),
          ),

          Row(
            children: [
              Text(
                'الإجمالي',
                style: StyleManager.font13Weight600.copyWith(
                  color: AppColor.white,
                ),
              ),

              const Spacer(),

              Text(
                '${finalTotal.toStringAsFixed(2)} ج.م',
                style: StyleManager.font15Weight700.copyWith(
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

class _RowItem extends StatelessWidget {
  final String title;
  final String value;

  const _RowItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: StyleManager.font12Weight500,
        ),
        const Spacer(),
        Text(
          value,
          style: StyleManager.font13Weight600.copyWith(
            color: AppColor.white,
          ),
        ),
      ],
    );
  }
}