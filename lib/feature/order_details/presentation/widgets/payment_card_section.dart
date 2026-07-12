import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

class PaymentCardSection extends StatelessWidget {
  const PaymentCardSection({
    super.key,
    required this.paymentMethod,
    this.paymentImage,
  });

  final String paymentMethod;
  final String? paymentImage;

  @override
  Widget build(BuildContext context) {
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
            'طريقة الدفع',
            style: StyleManager.font13Weight600.copyWith(
              color: AppColor.white,
            ),
          ),

          SizedBox(height: 12.h),

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
                Container(
                  width: 34.w,
                  height: 34.w,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.payments_outlined,
                    color: Colors.green,
                    size: 16.sp,
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Text(
                    paymentMethod,
                    style: StyleManager.font12Weight500.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (paymentImage != null) ...[
            SizedBox(height: 12.h),

            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: paymentImage!,
                height: 180.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  height: 180.h,
                  color: AppColor.background,
                ),
                errorWidget: (_, __, ___) => Container(
                  height: 180.h,
                  color: AppColor.background,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColor.textSecondary,
                    size: 26.sp,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}