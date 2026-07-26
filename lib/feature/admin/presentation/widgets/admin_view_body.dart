import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/recent_order_card.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/statistics_section.dart';

import 'best_seller_card.dart';

class AdminViewBody extends StatelessWidget {
  const AdminViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: StatisticsSection(),
            ),
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2,child: RecentOrdersCard()),
                  SizedBox(width: 10),
                  Expanded(child: BestSellerCard()),
                ],
              ),
            ),
          ],
        )
    );
  }
}
