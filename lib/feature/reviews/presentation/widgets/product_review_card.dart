import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/style_manager.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_constants.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.card,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColor.mainColor.withOpacity(AppConstants.borderColor),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: AppColor.border),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Product Image
          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColor.border),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: CachedNetworkImage(
                imageUrl: product.image ?? "",
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            product.name,
            textAlign: TextAlign.center,
            style:StyleManager.font16Weight700(context).copyWith(
              fontWeight: FontWeight.w500,
            )
          ),

          const SizedBox(height: 10),

          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
            decoration: BoxDecoration(
              color: AppColor.mainColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              product.category,
              style: StyleManager.font12Weight500(context).copyWith(
                color: AppColor.mainColor
              )
            ),
          ),

          const SizedBox(height: 22),

          Row(
            children: [

              Expanded(
                child: _InfoCard(
                  icon: Icons.attach_money,
                  title: "السعر",
                  value: "${product.price} ج",
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _InfoCard(
                  icon: Icons.star,
                  title: "التقييم",
                  value: product.averageRating.toStringAsFixed(1),
                  color: Colors.amber,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _InfoCard(
                  icon: Icons.reviews,
                  title: "المراجعات",
                  value: "${product.reviewsCount}",
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "الوصف",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColor.border),
            ),
            child: Text(
              product.description,
              style: StyleManager.font12Weight500(context).copyWith(
                color: AppColor.textSecondary,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
    this.color = AppColor.mainColor,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColor.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}