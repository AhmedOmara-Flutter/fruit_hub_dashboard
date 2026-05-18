import 'package:flutter/material.dart';

import 'customer_info_item.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key});

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
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200),
                  image: DecorationImage(
                    image: NetworkImage("https://i.pravatar.cc/300"),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "احمد عماره",
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "ahmed@email.com",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "01204391511",
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
            children: const [
              CustomerInfoItem(
                icon: Icons.shopping_bag_outlined,
                title: "12",
                subtitle: "طلبات",
              ),
              CustomerInfoItem(
                icon: Icons.payments_outlined,
                title: "15,200 ج",
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
