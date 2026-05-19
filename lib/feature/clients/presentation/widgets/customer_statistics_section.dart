import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/utils/app_color.dart';
import 'package:fruit_hub_dashboard/feature/clients/presentation/widgets/statistics_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../view_model/clients_cubit.dart';

class CustomerStatisticsSection extends StatelessWidget {
  const CustomerStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsCubit, ClientsState>(
      builder: (context, state) {
        if (state is GetClientsLoading) {
          return Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Skeletonizer(
                  child: StatisticsCard(
                    model: StatisticsCardModel(
                      color: AppColor.mainColor,
                      icon: Icons.people,
                      title: '----------------',
                      subTitleNumber: '-----',
                      subTitleText: '--------------------',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Skeletonizer(
                  child: StatisticsCard(
                    model: StatisticsCardModel(
                      color: Colors.red,
                      icon: Icons.attach_money,
                      title: '----------------',
                      subTitleNumber: '-----',
                      subTitleText: '--------------------',
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),
            ],
          );
        }
        final clients = context.read<ClientsCubit>().clients;
        final orders = context.read<ClientsCubit>().orders;
        double total = orders.fold(
          0.0,
          (sum, order) => sum + order.allOrdersPrice()
        );
        return Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: StatisticsCard(
                model: StatisticsCardModel(
                  color: AppColor.mainColor,
                  icon: Icons.people,
                  title: 'اجمالي العملاء',
                  subTitleNumber: '${clients.length}',
                  subTitleText: 'كل العملاء',
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: StatisticsCard(
                model: StatisticsCardModel(
                  color: Colors.red,
                  icon: Icons.attach_money,
                  title: 'اجمالي المبيعات',
                  subTitleNumber: '${total.toStringAsFixed(0)} جنيه',
                  subTitleText: 'كل المبيعات',
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        );
      },
    );
  }
}