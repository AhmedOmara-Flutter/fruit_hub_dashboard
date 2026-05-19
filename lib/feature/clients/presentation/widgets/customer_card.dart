import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/entities/user_entity.dart';
import 'customer_info_item.dart';

class CustomerCard extends StatelessWidget {
  final UserEntity user;
  final List<OrderEntity> orders;

  const CustomerCard({super.key, required this.user, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 8, right: 8, top: 5),
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
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade100,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: user.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,

                    placeholder: (context, url) => Skeletonizer(
                      enabled: true,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    errorWidget: (context, url, error) => Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.userName,
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 2),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      user.phone,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomerInfoItem(
                icon: Icons.shopping_bag_outlined,
                title: "${orders.length}",
                subtitle: "طلبات",
              ),
              CustomerInfoItem(
                icon: Icons.payments_outlined,
                title:'${orders.fold(
                  0.0,
                      (sum, order) => sum + order.allOrdersPrice(),
                )}',
                subtitle: "إجمالي الشراء",
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Text('عرض الطلبات', textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
