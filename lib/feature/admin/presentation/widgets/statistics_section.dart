import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/view_model/admin_cubit.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/view_model/clients_cubit.dart';

import '../../../clients/presentation/widgets/statistics_card.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatisticsCard(
                model: StatisticsCardModel(
                  color: Colors.green,
                  icon: Icons.people,
                  title: 'اجمالي العملاء',
                  subTitleNumber:
                      '${context.watch<ClientsCubit>().clients.length}',
                  subTitleText: 'عدد العملاء المسجلين',
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: StatisticsCard(
                model: StatisticsCardModel(
                  color: Colors.orange,
                  icon: Icons.receipt_long_outlined,
                  title: 'اجمالي الطلبات',
                  subTitleNumber:
                      '${context.watch<ClientsCubit>().orders.length}',
                  subTitleText: 'الطلبات المنفذة',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: StatisticsCard(
                model: StatisticsCardModel(
                  color: Colors.purple,
                  icon: Icons.inventory_2_outlined,
                  title: 'اجمالي المنتجات',
                  subTitleNumber:
                      '${context.watch<AdminCubit>().products.length}',

                  subTitleText: 'المنتجات المتاحة',
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: StatisticsCard(
                model: StatisticsCardModel(
                  color: Colors.blue,
                  icon: Icons.attach_money,
                  title: 'اجمالي المبيعات',
                  subTitleNumber: ' ${context.watch<AdminCubit>().totalSales.toStringAsFixed(2)}',
                  subTitleText: 'إجمالي الإيرادات',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

      ],
    );
  }
}
