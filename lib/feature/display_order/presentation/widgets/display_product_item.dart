import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/entities/cart_item_entity.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/style_manager.dart';

class DisplayProductItem extends StatelessWidget {
  final CartItemEntity item;

  const DisplayProductItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: item.product.image ?? '',
              width: 58.w,
              height: 58.w,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 58.w,
                height: 58.w,
                color: AppColor.card,
              ),
              errorWidget: (_, __, ___) => Container(
                width: 58.w,
                height: 58.w,
                color: AppColor.card,
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: StyleManager.font13Weight600.copyWith(
                    color: AppColor.white,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  '${item.unitPrice.toStringAsFixed(2)} ج.م',
                  style: StyleManager.font12Weight500.copyWith(
                    color: AppColor.mainColor,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: AppColor.mainColor.withOpacity(.15),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              '×${item.quantity}',
              style: StyleManager.font13Weight600.copyWith(
                color: AppColor.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}