
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/admin/presentation/widgets/recent_order_loading.dart';

import '../../../../core/helper_function/get_date_formate.dart';
import '../view_model/admin_cubit.dart';
import 'order_item.dart';

class RecentOrdersListView extends StatelessWidget {
  const RecentOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        final cubit = context.read<AdminCubit>();
        final recentOrders = cubit.recentOrders;

        final isLoading = state is GetOrdersLoading;

        if (isLoading) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) =>
            const OrderItemSkeleton(),
            separatorBuilder: (context, index) =>
                Divider(color: Colors.grey.shade200),
          );
       }

        if (recentOrders.isEmpty) {
          return const SizedBox();
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentOrders.length,
          itemBuilder: (context, index) {
            final order = recentOrders[index];

            return OrderItem(
              image: order.userEntity!.image,
              amount: '${order.allOrdersPrice()}',
              status: '',
              statusColor: Colors.orange,
              customerName: order.userEntity!.userName,
              time: getTimeOnly(order.createdAt.toString()),
              products: order.cartEntity.cartItems
                  .map((item) =>
              '${item.product.name} × ${item.quantity}')
                  .join('\n'),
            );
          },
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey.shade200),
        );
      },
    );
  }
}