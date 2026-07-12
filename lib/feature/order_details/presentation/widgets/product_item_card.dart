import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/cart_item_entity.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.item,
  });
  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: item.product.image!,
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
                  size: 18.sp,
                ),
              ),
            ),
          ),

          SizedBox(width: 10.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StyleManager.font12Weight500.copyWith(
                    color: AppColor.white,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  '${item.unitPrice.toStringAsFixed(2)} ج.م',
                  style: StyleManager.font13Weight700,
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
              color: AppColor.mainColor.withOpacity(.12),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColor.mainColor.withOpacity(.25),
              ),
            ),
            child: Text(
              '×${item.quantity}',
              style: StyleManager.font13Weight700,
            ),
          ),
        ],
      ),
    );
  }
}