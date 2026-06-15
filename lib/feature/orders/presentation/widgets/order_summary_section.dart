import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
    required this.time,
    required this.totalPrice,
  });

  final String time;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.access_time_rounded,
              size: 15,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(width: 8),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'وقت الطلب',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.grey,
                ),
              ),
              Text(
                time,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الإجمالي',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.grey,
                ),
              ),
              Text(
                totalPrice,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}