import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/entities/offer_entity.dart';
import 'package:fruit_hub_dashboard/core/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/my_products/presentation/widgets/product_actions_section.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final OfferEntity? offer;

  const ProductCard({
    super.key,
    required this.product,
    this.offer,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasOffer = offer != null;
    final discount = offer?.discountPercentage ?? 0;
    final oldPrice = offer?.priceBeforeDiscount ?? product.price;
    final newPrice = offer?.priceAfterDiscount ?? product.price;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: AppColor.border,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 95.w,
                    height: 95.w,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColor.transparent,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(
                        color: AppColor.border,
                      ),
                    ),
                    child: Image.network(
                      product.image ?? '',
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.image_not_supported,
                        color: AppColor.textSecondary,
                        size: 32.sp,
                      ),
                    ),
                  ),
                  if (hasOffer)
                    Positioned(
                      top: 6.h,
                      right: 6.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.red,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          '-${discount.toInt()}%',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(width: 16.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColor.textPrimary,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    hasOffer
                        ? Row(
                      children: [
                        Flexible(
                          child: Text(
                            '$oldPrice ج',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                              color: AppColor.textSecondary,
                              decoration:
                              TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Flexible(
                          child: Text(
                            '$newPrice ج',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                              color: AppColor.red,
                            ),
                          ),
                        ),
                      ],
                    )
                        : Text(
                      '${product.price} ج',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(
                        color: AppColor.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          if (hasOffer)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColor.mainColor.withOpacity(.08),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColor.mainColor.withOpacity(.2),
                ),
              ),
              child: Text(
                '📅 من ${_formatDate(offer!.startDate)} ← إلى ${_formatDate(offer!.endDate)}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.textPrimary,
                ),
              ),
            ),

          SizedBox(height: 10.h),

          ProductActionsSection(
            product: product,
            hasOffer: hasOffer,
            offer: offer,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}