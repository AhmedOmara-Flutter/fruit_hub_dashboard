import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:fruit_hub_dashboard/core/helper_function/get_date_formate.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_constants.dart';

class DisplayOrdersViewBody extends StatelessWidget {
  final List<OrderEntity> orders;

  const DisplayOrdersViewBody({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "طلب #${index + 1}",
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      getDateFormate(order.createdAt.toString()),
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      order.isCashOnDelivery == true
                          ? "كاش عند الاستلام"
                          : "أونلاين",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.orange),
                    ),
                  ],
                ),
                SizedBox(height: 15,child: Divider(),),
                ...order.cartEntity.cartItems.map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: e.product.image!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Skeletonizer(child: Container()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error, color: Colors.red),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            e.product.name,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        Text(
                          'x${e.quantity}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${e.product.price} جنيه ',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,child: Divider(),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.payments_outlined,
                          color: const Color(0xff166534),
                          size: 26,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'الإجمالي',
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium!.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // Text(
                        //   '+${AppConstants.delivery}شحن',
                        //   style: Theme.of(
                        //     context,
                        //   ).textTheme.titleMedium!.copyWith(color: AppColor.mainColor),
                        // ),
                        const SizedBox(width: 10),
                        Text(
                          '${order.allOrdersPrice()} جنيه',
                          style: Theme.of(
                            context,
                          ).textTheme.displaySmall!.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
