import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cubit/offers_cubit/offers_cubit.dart';
import '../../../../core/entities/offer_entity.dart';
import '../../../../core/helper_function/custom_show_dialog.dart';
import '../../../../core/utils/app_color.dart';

class OfferProductCard extends StatelessWidget {
  final OfferEntity offer;

  const OfferProductCard({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    Opacity(
    opacity: offer.isExpired ? .55 : 1,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColor.card,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: offer.isExpired
                ? AppColor.red
                : AppColor.border,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(.2),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
            children: [
        ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: SizedBox(
          width: 90.w,
          height: 90.h,
          child: CachedNetworkImage(
            imageUrl: offer.image,
            fit: BoxFit.contain,
            placeholder: (context, url) => Center(
              child: SizedBox(
                width: 20.w,
                height: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColor.mainColor,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.image_not_supported_outlined,
              color: AppColor.textSecondary,
              size: 28.sp,
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
              offer.name,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(
                color: AppColor.textPrimary,
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              "قبل الخصم: ${offer.priceBeforeDiscount.toStringAsFixed(2)} جنيه",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                color: AppColor.textSecondary,
              ),
            ),

            SizedBox(height: 8.h),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "من",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Icon(
                      Icons.arrow_downward,
                      size: 18.sp,
                      color: AppColor.textSecondary,
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      "إلى",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.mainColor
                              .withOpacity(.08),
                          borderRadius:
                          BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          _formatDate(offer.startDate),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            color:
                            AppColor.textPrimary,
                          ),
                        ),
                      ),

                      SizedBox(height: 18.h),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.accentColor
                              .withOpacity(.08),
                          borderRadius:
                          BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          _formatDate(offer.endDate),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            color:
                            AppColor.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 6.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.mainColor.withOpacity(.12),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "${offer.discountPercentage}% خصم",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    "بعد الخصم",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Text(
                    "${offer.priceAfterDiscount.toStringAsFixed(2)} جنيه",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  InkWell(
                    onTap: () async {
                      CustomShowDialog.show(
                        context,
                        title: 'حذف العرض',
                        content: const Text(
                          'هل أنت متأكد أنك تريد حذف هذا العرض؟',
                          textAlign: TextAlign.center,
                        ),
                        cancel: () => Navigator.pop(context),
                        accept: () async {
                          Navigator.pop(context);
                          await context
                              .read<OffersCubit>()
                              .deleteOffer(offer);
                        },
                        flag: Icons.local_offer_outlined,
                        color: AppColor.red,
                      );
                    },
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.red.withOpacity(.12),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColor.red,
                        ),
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        color: AppColor.red,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
        ),
      ),
    ),

        /// شريط انتهاء العرض
        if (offer.isExpired)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColor.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "انتهى العرض",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}