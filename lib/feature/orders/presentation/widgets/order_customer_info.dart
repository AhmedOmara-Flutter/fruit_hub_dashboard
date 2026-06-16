import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class OrderCustomerInfo extends StatelessWidget {
  const OrderCustomerInfo({
    super.key,
    required this.customerName,
    required this.orderId,
    required this.address,
    required this.products, required this.price,
  });

  final String customerName;
  final String orderId;
  final String address;
  final String products;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customerName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            '#اوردر - $orderId',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            address,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                products,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.mainColor,
                ),
              ),
              Text(
                price,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
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