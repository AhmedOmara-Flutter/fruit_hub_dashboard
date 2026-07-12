import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';
import 'product_item_card.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final items = order.cartEntity.cartItems;

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
            'المنتجات',
            style: StyleManager.font13Weight600.copyWith(
              color: AppColor.white,
            ),
          ),

          SizedBox(height: 12.h),

          ...List.generate(
            items.length,
                (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == items.length - 1 ? 0 : 8.h,
              ),
              child: ProductItemCard(
                item: items[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}