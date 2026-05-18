import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/widgets/statistics_card.dart';

class CustomerStatisticsSection extends StatelessWidget {
  const CustomerStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),

        Expanded(
          child: StatisticsCard(
            model: StatisticsCardModel(
              color: AppColor.mainColor,
              icon: Icons.people,
              title: 'اجمالي العملاء',
              subTitleNumber: '321',
              subTitleText: 'كل العملاء',
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: StatisticsCard(
            model: StatisticsCardModel(
              color: Colors.deepPurple,
              icon: Icons.attach_money,
              title: 'اجمالي المبيعات',
              subTitleNumber: '1,225,584 \$',
              subTitleText: 'هذا الشهر',
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
