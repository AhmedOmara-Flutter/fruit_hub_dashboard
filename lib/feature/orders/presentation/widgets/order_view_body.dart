import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/orders/presentation/widgets/build_order_card.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            itemBuilder: (context, index) => BuildOrderCard(),
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
