import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/utils/route_manager.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/recent_orders_list_view.dart';
import 'package:fruit_hub_dashboard/feature/main/presentation/view_model/main_cubit.dart';

import '../../../orders/presentation/view_model/orders_cubit.dart';
import '../view_model/admin_cubit.dart';

class RecentOrdersCard extends StatelessWidget {
  const RecentOrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'الطلبات الحديثة',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 10),
          RecentOrdersListView(),
          if(context.watch<OrdersCubit>().orders.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  context.read<MainCubit>().changeIndex(4);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.grid_view_rounded, size: 16),
                      Text(
                        'عرض جميع الطلبات',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(color: Colors.black),
                      ),
                      Icon(Icons.arrow_forward_ios_outlined, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

