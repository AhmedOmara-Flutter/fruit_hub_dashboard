import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/entities/order_entity.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_back_button.dart';
import 'display_order_card.dart';

class DisplayOrdersViewBody extends StatelessWidget {
  final List<OrderEntity> orders;

  const DisplayOrdersViewBody({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomBackButton(),
              Row(
                children: [
                  Icon(Icons.display_settings, color: AppColor.mainColor),
                  const SizedBox(width: 8),
                  Text(
                    "عرض الطلبات",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColor.textPrimary,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 40),
            ],
          ),
        ),

        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: orders.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 0,
    mainAxisSpacing: 0,
    childAspectRatio:1.15,
    ),
            itemBuilder: (context, index) {
              return DisplayOrderCard(
                order: orders[index],
                orderNumber: orders.length - index,
              );
            },
          ),
        ),
      ],
    );
  }
}
